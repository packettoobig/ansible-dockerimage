#!/bin/bash

#
# VARIABLES
#
randomstring=$(cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sleeptime=0
mntbaseauthsock='/ssh-auth-sock'
mntsrc1="$HOME/.ssh/id_rsa"
mntdst1="/root/.ssh/id_rsa"
mntopt1="ro"
mntsrc2="$HOME/git"
mntdst2="/root/git"
mntopt2="rw"
container="ansible"
containerversion='latest'
containerfullname="${container}_${containerversion}_${randomstring}"
containerpath="packettoobig/$container:$containerversion"
containerhostname="container-$container-$randomstring"

#
# INIT
#
unameresult="$(uname -s)"
# Mac has a specific way of handling the ssh auth sock
if [[ "$unameresult" == "Darwin" ]]
then
    local_ssh_authsock='/run/host-services/ssh-auth.sock'
    authsockmnt="$mntbaseauthsock"
else
    local_ssh_authsock=$(dirname $SSH_AUTH_SOCK)
    authsockmnt="$mntbaseauthsock/ssh"
fi

#
# SCRIPT
#
echo "####################################################################################################"
echo "Running a new $container container version $containerversion interactively"
echo "####################################################################################################"
sleep $sleeptime
echo "Lauching $containerhostname"
sudo docker run --name $containerfullname -h $containerhostname \
	-v $local_ssh_authsock:$mntbaseauthsock \
	-e SSH_AUTH_SOCK=$authsockmnt \
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
