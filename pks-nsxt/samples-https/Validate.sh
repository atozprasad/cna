#!/bin/bash
echo "Validating Ingress object creation"
kubectl get ingress
echo "Press Enter key ...";read
echo "Ensure that you can see the Ingress object along with the Ingress IP address"
echo "Navigate to NSX-T Manager  > PKS Cluster Load Balancer > HTTPS ingress controller > LB Profiles and verify that you see the certificate under Client Side SSL section."
echo "============Validate Https======="
echo "Validate Tea Service "
echo "curl -k https://cafe.example.com/tea"
curl -k https://cafe.example.com/tea
echo "Press Enter key ...";read
echo ""
echo "Validate Coffee Service "
echo "curl -k https://cafe.example.com/coffee"
curl -k https://cafe.example.com/coffee
echo "Press Enter key ...";read
echo ""

echo "============Validate Http======="
echo "Validate Tea Service "
echo "curl  http://cafe.example.com/tea"
curl -k http://cafe.example.com/tea
echo "Press Enter key ...";read
echo ""
echo "Validate Coffee Service "
echo "curl  http://cafe.example.com/coffee"
curl -k http://cafe.example.com/coffee
echo "Press Enter key ...";read
echo ""

echo "Validation Completed."
