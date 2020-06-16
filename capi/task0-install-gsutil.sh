#!/bin/bash
figlet "Setup- gsutil"
#Download bits
echo -e "\n Downloading bits from internet"

wget https://storage.googleapis.com/pub/gsutil.tar.gz
sudo tar xfz gsutil.tar.gz -C /usr/local/bin
export PATH=${PATH}:/usr/local/bin/gsutil
echo "export PATH=${PATH}:/usr/local/bin/gsutil"  >> ~/.bash_profile
echo -e "\n Validate gsutil "
gsutil version
figlet "Done with this task"
