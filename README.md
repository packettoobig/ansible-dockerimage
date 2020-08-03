# blaeu-dockerimage

## Useful Links
**Image Location :** [https://hub.docker.com/r/pilbbq/blaeu](https://hub.docker.com/r/pilbbq/blaeu)<br/>
**Repo Location :** [https://github.com/pilbbq/blaeu-dockerimage](https://github.com/pilbbq/blaeu-dockerimage)<br/>
**Blaeu Code Location:** [https://framagit.org/bortzmeyer/blaeu](https://framagit.org/bortzmeyer/blaeu)

## Diff with original debian
We just `pip3 install blaeu` in addition to [the changes in the original image](https://github.com/pilbbq/debian-custom-dockerimage)

## How to use
The *docker.sh* script can be used as-is on a sudo-enabled machine running bash.<br/>
You will of course need docker to be installed. Please refer to [https://get.docker.com/](https://get.docker.com/) for information on this subject.

The script assumes you have a `.atlas/auth` file in your `$HOME` and mounts it to the same location in the docker file.

To get an API key from RIPE atlas, go to [https://atlas.ripe.net/keys/](https://atlas.ripe.net/keys/), and create a new one with "**Schedule a new measurement"** permissions.
Then, put it in `~/.atlas/auth`. No formatting required.

Once you have docker and your RIPE Atlas API key, just :

	git clone https://github.com/pilbbq/blaeu-dockerimage.git
	cd debian-custom-dockerimage
	./docker.sh

## Misc
Image is built everytime there is a commit to this repo.<br/>
You can see the latest builds here : [https://hub.docker.com/r/pilbbq/blaeu/builds](https://hub.docker.com/r/pilbbq/blaeu/builds)
