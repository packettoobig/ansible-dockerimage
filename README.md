# ansible-dockerimage

## Useful Links
**Image Location :** [https://hub.docker.com/r/packettoobig/ansible](https://hub.docker.com/r/packettoobig/ansible)<br/>
**Repo Location :** [https://github.com/packettoobig/ansible-dockerimage](https://github.com/packettoobig/ansible-dockerimage)<br/>

## Diff with original debian
We just install ansible and some python modules in addition to [the changes in the original image](https://github.com/packettoobig/debian-custom-dockerimage).

## How to use
You will of course need docker to be installed. Please refer to [https://get.docker.com/](https://get.docker.com/) for information on this subject.<br/>
Once that's done, you can use something like this:

    docker run -v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa -v $HOME/git/myansible:/root/ansible/ -it packettoobig/ansible /bin/bash
It will run the container interactively with your ssh private key and your git repo mounted.<br/>
Once you are interacting with the container, you will probably want to :

    eval $(ssh-agent -s)
    ssh-add
    ansible-playbook myplaybook.yml -i myinventory -u myuser

## Misc
Image is built everytime there is a commit to this repo.<br/>
You can see the latest builds here : [https://hub.docker.com/r/packettoobig/ansible/builds](https://hub.docker.com/r/packettoobig/ansible/builds)
