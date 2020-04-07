#!/bin/bash
 wget http://build-squid.eng.vmware.com/build/mts/release/bora-15916418/publish/lin64/tkg_release/tanzu_tkg-cli-v1.0.0-rc.3-1+vmware.1/executables/tkg-linux-amd64-v1.0.0-rc.3-1+vmware.1.gz
 gunzip tkg-linux-amd64-v1.0.0-rc.3-1+vmware.1.gz
 chmod a+x tkg-linux-amd64-v1.0.0-rc.3-1+vmware.1
 sudo mv tkg-linux-amd64-v1.0.0-rc.3-1+vmware.1 /usr/local/bin/tkg
 
 wget http://build-squid.eng.vmware.com/build/mts/release/bora-15916418/publish/lin64/tkg_release/node-v1.17.3+vmware.1/images/photon-3-v1.17.3+vmware.1.ova
 wget http://build-squid.eng.vmware.com/build/mts/release/bora-15916418/publish/lin64/tkg_release/haproxy-v0.6.2+vmware.2/images/photon-3-capv-haproxy-v0.6.2+vmware.2.ova
