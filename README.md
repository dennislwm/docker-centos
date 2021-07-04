# docker-centos

Self-hosted Docker on a CentOS 7 cloud server.

<!-- TOC -->

- [docker-centos](#docker-centos)
  - [Project](#project)
    - [Quick Docker Install](#quick-docker-install)
    - [Setting up CentOS 7 server](#setting-up-centos-7-server)
    - [Removing Older Version](#removing-older-version)
    - [Installing Docker Community Edition](#installing-docker-community-edition)
    - [Starting Docker](#starting-docker)
    - [Adding User to Docker Group](#adding-user-to-docker-group)

<!-- /TOC -->

## Project

### Quick Docker Install

Docker provides a script on its GitHub repository for quickly installing the latest Docker CE releases on supported linux distros.

Download and install the script.

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

You may now skip directly to [Starting Docker](#starting-docker).

### Setting up CentOS 7 server

Before we begin, we're going to need a CentOS 7 cloud server to work with. Create a CentOS 7 cloud server and run the following on it:

```bash
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo yum install -y curl yum-utils device-mapper-persistent-data lvm2
sudo yum update -y
```

### Removing Older Version

Run the following command to remove any existing older version of Docker:

```bash
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```

### Installing Docker Community Edition

Run the following commands to add a Docker yum repository and to install Docker:

```bash
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
```

### Starting Docker

Enable and start Docker.

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

### Adding User to Docker Group

Add a user to Docker group. 

*Note: You'll need to substitute in your values for [USERNAME].*

```bash
sudo usermod -a -G docker [USERNAME]
```
