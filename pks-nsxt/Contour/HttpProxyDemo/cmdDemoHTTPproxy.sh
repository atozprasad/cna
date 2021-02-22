#!/bin/bash
figlet "DEMO : CONTOUR TLS_TERMINATION"
echo -e "Step0 : Cleaning existing TLS_TERMINATION demo resources"
kubectl delete -f  .
echo -e "\n NextStep...";read;

echo -e "\n Lets check if we have any HTTPProxy objects already...";
kubectl get httpproxy
echo -e "\n NextStep...";read;clear
############################# Step 1 #####################

figlet "1. Setup Pre-Reqs"
echo -e "Lets examine the 01-prereq.yaml ...";read;
more 01-prereq.yaml 
echo -e "\n\nkubectl apply -f 01-prereq.yaml ... ";read;
kubectl apply -f 01-prereq.yaml 
echo "NextStep ...";read;clear
############################# Step 2 #####################

figlet "2. root HTTPProxy"
echo -e "Now we’ll apply our root HTTPProxy. This proxy is unique since it defines the fqdn for the requests. \nIn our example, the FQDN is local.projectcontour.io. \nIt configures two routes, one for / and another for /secure."
echo -e "Lets examine the 02-proxy-basic.yaml ...";read;
more 02-proxy-basic.yaml
echo -e "\n\nkubectl apply -f 02-proxy-basic.yaml ... ";read;
kubectl apply -f 02-proxy-basic.yaml
echo -e "\n\n"
echo -e "This proxy configures any request to projectcontour.io/ to be handled by the service rootapp. Requests to /secure will be handled by the service secureapp-default."
echo -e "At this point, the following requests map like this:"
echo -e "GET projectcontour.io/ → rootapp:80 service"
echo -e "GET projectcontour.io/secure → secureapp-default:80 service"
echo -e "Sample request curl http://local.projectcontour.io/ "
echo -e "Lets validate the results curl http://local.projectcontour.io/   ...";read;
curl http://local.projectcontour.io/
echo -e "\n NextStep...";read;clear;

############################# Step 3 #####################
figlet "3. HTTPProxy-Conditions"
echo -e "New in HTTPProxy is a concept called conditions, which allows you to define a set of request parameters that need to match for a route to receive requests. \nContour allows for a prefix condition as well as a set of header conditions to be defined on requests."
echo -e "Let’s reconfigure the root proxy to handle requests with HTTP headers. \nWe will target any request to local.projectcontour.io/secure that matches the header User-Agent containing the value of Chrome to route to the secureapp backend. \nAny other requests to local.projectcontour.io/secure that do not match the header we defined should route to secureapp-defaul"
echo -e "In the previous example, we added prefix conditions to the route. \nIn this example, we add a new type called header, which allows us to define a header key and value that must match the request. \nHeader conditions can use exact to match the value exactly, or they can use contains to match a specified value that exists somewhere in the header value. (We can also specify notexact and notcontains, which inverse the match.)"
echo -e "\n\n\n Lets examine 03-proxy-conditions.yaml ...";read;
more 03-proxy-conditions.yaml
echo -e "Lets apply the file, \n\nkubectl apply -f 03-proxy-conditions.yaml ...";read;
kubectl apply -f 03-proxy-conditions.yaml
echo -e "\n\n"
echo -e "
\nIt’s important to call out that for a request to match a route, all conditions defined must match. \nIn the example we just applied, for the request to route to the secreapp service, it must have a path prefix of /secure as well as have a header User-Agent containing the value Chrome. \n Adding additional header conditions would extend the match requirements for that route.
\n
\nAt this point the following requests map as follows:
\n
\nGET local.projectcontour.io/ → rootapp:80 service
\nGET local.projectcontour.io/secure → secureapp-default:80 service
\nGET local.projectcontour.io/secure + Header[User-Agent: Chrome] → secureapp:80 service
"
echo "Lets validate the Results : curl http://local.projectcontour.io/secure ...";read;
curl http://local.projectcontour.io/secure
echo -e "\n NextStep...";read;
echo "\n\ncurl -H "User-Agent: Chrome" http://local.projectcontour.io/secure ...";read;
curl -H "User-Agent: Chrome" http://local.projectcontour.io/secure
echo -e "\n NextStep...";read;clear;

############################# Step 4 #####################
figlet "4. Includes across Namespaces"
echo -e "
Also new in HTTPProxy is the concept of includes for a resource. \n Defining an include on an HTTPProxy causes Contour to prepend any conditions defined in the include to the conditions of the child proxy referenced.\n  This can be used to delegate path prefixes to teams in different namespaces or require specific headers to be present on requests.\n  There isn’t a limit to the number of times a proxy can reference an include.\n \n \n 

First, let’s set up a new marketing team namespace allowing them to self-manage its HTTPProxy resources as well as deploy a sample app/service.\n  The marketing team will be in charge of managing the /blog path from the local.projectcontour.io domain.
"
echo -e"Lets examine the file more 04-marketing-prereq.yaml ...";read;
more 04-marketing-prereq.yaml
echo -e "\n\nkubectl apply -f 04-marketing-prereq.yaml ...";read;
kubectl apply -f 04-marketing-prereq.yaml
echo -e "
Next, let’s update our root proxy to pass off a path to the marketing team working in the projectcontour-marketing namespace.\n We’ll also create the marketing team’s HTTPProxy, which is referenced from the root HTTPProxy and will include the path condition of /blog to the marketing team’s proxy named blogsite.
"
echo -e "\nLets exampine the file:  more 04-proxy-include-basic.yaml ...";read;
more 04-proxy-include-basic.yaml
echo "\n\nkubectl apply -f 04-proxy-include-basic.yaml ...";read;
kubectl apply -f 04-proxy-include-basic.yaml
echo -e "
Since the root proxy included the path of /blog, requests that match local.projectcontour.io/blog will route to the marketing team’s service named wwwblog in the projectcontour-marketing namespace.\n You will notice we didn’t define any conditions on the marketing teams proxy.\n We don’t need to define them because the root proxy passed the path prefix condition to this HTTPProxy through the include.

It’s important to note that no one else in the cluster can now utilize this path prefix.\n If another team would create an HTTPProxy referencing the same path, Contour would reject it because it is not part of a delegation chain."

echo -e "Lets validate the  Sample Requests curl http://local.projectcontour.io/blog  "
curl http://local.projectcontour.io/blog
echo -e "\n NextStep...";read;clear;
############################# Step 5#####################
figlet "5. Includes to the same Namespace"
echo -e "Just as we learned in the first example of how conditions are applied to routes, the same logic is applied to conditions on an include.\n Currently, the marketing team is responsible for the path /blog, but let’s add a few more requirements.\n\n

The marketing team wants to create an information site, which will be served by the path /blog/info.\n We will create another HTTPProxy to define how the information application should be accessed.\n This new HTTPProxy will be included in the path /info from the blogsite HTTPProxy in the projectcontour-marketing namespace.\n\n

Since Conditions are appended to the HTTPProxy when Contour processes them, the result for the information site will have the path /blog/info."  
echo -e "\n\nLets examine the 05-proxy-include-info.yaml ...";read;
more 05-proxy-include-info.yaml
echo "\nkubectl apply -f 05-proxy-include-info.yaml"
kubectl apply -f 05-proxy-include-info.yaml

echo -e "\n Lets check the Sample Requests";read;
echo -e "curl http://local.projectcontour.io/blog/info "
curl http://local.projectcontour.io/blog/info
echo -e "\n NextStep...";read;clear;

############################# Step 6#####################
figlet "6. Includes with Headers"
echo -e "Finally to complete our example, the administrative team now doesn’t want the marketing site to be served by Chrome or Firefox browsers.\n  This rule needs to apply to all applications in the projectcontour-marketing namespace.\n \n 

We can easily implement this requirement by just adding another set of conditions to the root HTTPProxy.\n  Once we add those, they will take effect across all the children of the root HTTPProxy defined in the projectcontour-marketing namespace."
echo -e "\n\nLets examine the 06-proxy-include-headers.yaml ...";read;
more 06-proxy-include-headers.yaml
echo -e "\n\nkubectl apply -f 06-proxy-include-headers.yaml"
kubectl apply -f 06-proxy-include-headers.yaml
echo -e "
Requests to local.projectcontour.io/blog/* that do not match the User-Agent header of Chrome or Firefox will now route to the appropriate services in the marketing team’s namespace.\n Any other requests will be handled by the rootapp service because it matches the other requests."
echo -e "Sample Requests"
echo -e "lets check with Safari brower. \ncurl -H User-Agent: Safari http://local.projectcontour.io/blog/info ...";read;
curl -H "User-Agent: Safari" http://local.projectcontour.io/blog/info
echo -e "\n Next Check...";read;
echo -e "\n\nlets check with Firefox brower. \ncurl -H User-Agent: Firefox http://local.projectcontour.io/blog/info ...";read;
curl -H "User-Agent: Firefox" http://local.projectcontour.io/blog/info
figlet "GAME OVER"


#echo -e "\n Lets Check the necessary objects been created or not"
#echo -e "kubectl get httpproxy"
#kubectl get httpproxy
#echo -e "\n NextStep...";read;
#
#echo -e "kubectl get secret contour-secret"
#kubectl get secret contour-secret
#echo -e "\n NextStep...";read;
#
#echo -e "kubectl get pods,svc,ingress -l app=tls_termination"
#kubectl get pods,svc,ingress -l app=tlsterminate
#echo -e "\n NextStep...";read;
#
#echo -e "Lets browse the app curl -k -H 'HOST:tls.contour.local' https://envoy.local"
#curl -v -k -H 'HOST:tls.contour.local' https://envoy.local
#echo -e "\n NextStep...";read;
#

