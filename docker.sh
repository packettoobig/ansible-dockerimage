#!/bin/bash

#
# VARIABLES
#
randomstring=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sleeptime=0
mntsrc1="$HOME/.ssh/id_rsa"
mntdst1="/root/.ssh/id_rsa"
mntopt1="ro"
mntsrc2="$HOME/git"
mntdst2="/root/git"
mntopt2="rw"
container="ansible"
containerversion='latest'
containerfullname="${container}_${containerversion}_${randomstring}"
containerpath="pilbbq/$container:$containerversion"
containerhostname="container-$container-$randomstring"

#
# SCRIPT
#
echo "####################################################################################################"
echo "Running a new $container container version $containerversion interactively"
echo "####################################################################################################"
sleep $sleeptime
echo "Lauching $containerhostname"
sudo docker run --name $containerfullname -h $containerhostname \
	-v $mntsrc1:$mntdst1:$mntopt1 \
	-v $mntsrc2:$mntdst2:$mntopt2 \
	-it $containerpath /bin/bash

sudo docker system df | awk '{print $1,$4}' | column -t
read -p "Do you wish to remove all local docker data ? [y/N] " RESP
if [ "$RESP" = "y" ] || [ "$RESP" = "yes" ]; then
  echo -e "Removing everything ... \n"
  sudo docker container stop $(sudo docker container ls -aq)
  sudo docker system prune -a -f
else
  echo "Exiting (nothing removed)"
fi
