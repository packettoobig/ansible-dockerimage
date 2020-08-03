# ansible-dockerimage

## Useful Links
**Image Location :** [https://hub.docker.com/r/pilbbq/ansible](https://hub.docker.com/r/pilbbq/ansible)<br/>
**Repo Location :** [https://github.com/pilbbq/ansible-dockerimage](https://github.com/pilbbq/ansible-dockerimage)<br/>

## Diff with original debian
We just install ansible and some python modules in addition to [the changes in the original image](https://github.com/pilbbq/debian-custom-dockerimage).

## How to use
You will of course need docker to be installed. Please refer to [https://get.docker.com/](https://get.docker.com/) for information on this subject.
Once that's done, you can for example use the following command:

    docker run -v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa -v $HOME/git/myansible:/root/ansible/ -it pilbbq/ansible /bin/bash
It will run the container interactively with your ssh private key and your git repo mounted.
Once you are intaracting with the container, you will probably want to :

    eval $(ssh-agent -s)
    ssh-add
    ansible-playbook myplaybook.yml -i myinventory -u myuser

## Misc
Image is built everytime there is a commit to this repo.<br/>
You can see the latest builds here : [https://hub.docker.com/r/pilbbq/ansible/builds](https://hub.docker.com/r/pilbbq/ansible/builds)
