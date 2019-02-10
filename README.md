# haskell-tools
Utilities for building and deploying **binary** native Linux distributions of Haskell programs. Compiled Docker images of tools are available in https://cloud.docker.com/u/tkachuklabs/repository/list dockerhub repositories.

<img src="private/logo.jpg" width="300"/>

## build-tools.sh
Docker containers are used to build Linux binaries in any other operating system.
This script is building Docker images which are used to build actual Haskell programs.
## push-tools.sh
Script can be used to push Docker images of tools to Dockerhub.
## install-keter.sh
Script installs [keter](https://github.com/snoyberg/keter) binaries and some basic configuration to remote Linux machine. Requires ssh connection.
```bash
$ ./install-keter.sh root@myservice.com

#
# installation process ...
#

# keter successfully installed to root@myservice.com
```
## deploy-yesod.sh
Script performs build and deploy of given [yesod](https://www.yesodweb.com/) application to remote Linux machine. Requires ssh connection.
```bash
$ ./deploy-yesod.sh /Users/username/projects/myservice root@myservice.com

#
# build and deployment process ...
#

# /Users/username/projects/myservice deployment to root@myservice.com succeeded
```
