# haskell-tools
Utilities for building and deploying **binary** native Linux distributions of Haskell programs.
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
