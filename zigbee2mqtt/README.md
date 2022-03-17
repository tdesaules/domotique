# ZIGBEE2MQTT DOCKER CONTAINER

to do stuff

## Git Flow 

The Git Flow is the most known workflow on this list. It was created by Vincent Driessen in 2010 and it is based in two main branches with infinite lifetime:
- main : this branch contains production code. All development code is merged into main sometime.
- develop : this branch contains pre-production code. When the features are finished then they are merged into develop.

During the development cycle, a variety of supporting branches are used:
- us/* : derived from feature/* if different developers work on a same user story that need to be split.
- feature/* : feature branches are used to develop new features for the upcoming releases. May branch off from develop and must merge into develop.
- hotfix/* : hotfix branches are necessary to act immediately upon an undesired status of main. May branch off from main and must merge into main anddevelop.
- release/* : release branches support preparation of a new production release. They allow many minor bug to be fixed and preparation of meta-data for a release. May branch off from develop and must merge into main and develop.

this image describe the worflow:

<img src="https://git-flow.readthedocs.io/fr/latest/_images/gitflow.png" width="500">

## Build docker imagage

This is the steps to build the emqx container image using buildx to have multiple arch and publish it to github registry.

First log in to github registry :

```shell
PAT="secret token"
echo $PAT | docker login ghcr.io --username tdesaules --password-stdin
```

Get the last docker/binfmt image hash from https://hub.docker.com/r/docker/binfmt/ and prepare the buildx for amd64 + arm64 :

```shell
docker run --rm --privileged docker/binfmt:a7996909642ee92942dcd6cff44b9b95f08dad64
docker buildx create --name mybuilder
docker buildx use mybuilder
docker buildx inspect --bootstrap
```

Next build the docker image :

```shell
docker buildx build --platform linux/arm64,linux/amd64 -t ghcr.io/tdesaules/vernemq-1.12.14-alpine3.15:1.0.0 . --push 
```

Look at the details : 

```shell
docker buildx imagetools inspect ghcr.io/tdesaules/vernemq-1.12.14-alpine3.15:1.0.0
```

eventually run it :

```shell
docker run ghcr.io/tdesaules/vernemq-1.12.14-alpine3.15:1.0.0@sha256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

## Docker Compose

to do stuff

## usbipb support to develop with a usb zigbee dongle

https://github.com/dorssel/usbipd-win/releases

sudo apt install linux-tools-5.4.0-77-generic hwdata
sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/5.4.0-77-generic/usbip 20

usbipd wsl list
usbipd wsl attach --busid 1-2
usbipd wsl detach --busid 1-2

lsusb

sudo apt install build-essential flex bison libssl-dev libelf-dev dwarves libncurses-dev
cd /tmp
wget https://github.com/microsoft/WSL2-Linux-Kernel/archive/refs/tags/linux-msft-wsl-5.10.102.1.zip
unzip linux-msft-wsl-5.10.102.1.zip
cd WSL2-Linux-Kernel-linux-msft-wsl-5.10.102.1
make menuconfig KCONFIG_CONFIG=Microsoft/config-wsl
make KCONFIG_CONFIG=Microsoft/config-wsl
cp arch/x86/boot/bzImage /mnt/c/Users/tdesa/wsl/kernel
vi /mnt/c/Users/tdesa/.wslconfig
[wsl2]
kernel = C:\\Users\\tdesa\\wsl\\kernel
wsl --shutdown
wsl


## Contributing

**Product Owner :**
- [Thibault DESAULE](mailto:thibault@desaules.me)

**Scrum Master :**
- [Thibault DESAULE](mailto:thibault@desaules.me)

**Development team :**
- [Thibault DESAULE](mailto:thibault@desaules.me)

***
