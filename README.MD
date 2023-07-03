# Sykes Cottages CDK Docker Images

## About

We use a variety of CDK containers at Sykes Cottages across most of our platforms, but due to a lack of official and maintained images we have introduced our own.
All of our CDK images are based off the [Base Sykes](https://github.com/SykesCottages/docker-base) image which uses the official Ubuntu Docker image.
We opted for this path to utilise aptitude so we could manage packages easier and utilise the package integrity verification that comes with apititude.

## Pre-Installed
All images contain JQ, Docker and the AWS CLI to support various CDK features. 

### AWS CLI
For the AWS CLI features you will need to define your AWS credentials by passing them to the container via the `.aws` mounts e.g.
```shell
docker run \
    -v ~/.aws/credentials:/root/.aws/credentials \
    -v ~/.aws/config:/root/.aws/config \
    sykescottages/cdk:latest \
    aws sts get-caller-identity
```
The mounting user can be variable depending on what user you run the container with.

### Docker

CDK allows you to build docker images for ECR repositories and to utilise this you will need docker available.
As you can't run docker directly within a container you will need to pass the docker sock to the container through a volume e.g.
```shell
docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    sykescottages/cdk:latest \
    docker --version
```

### JQ

The addition of JQ was to expand on the AWS CLI's version of JQ which is limited.

```shell
docker run \
    sykescottages/cdk:latest \
    jq --version
```

## Supported versions and available tags

- 1.203.0 (Deprecated) - `sykescottages/cdk:1`
- **2.86.0 (Current)** - `sykescottages/cdk:2`

## Usage

Pulling an image:
```
docker pull sykescottages/cdk:version
```

Running a container:
```
docker run -it \
    -v ~/.aws/credentials:/root/.aws/credentials \
    -v ~/.aws/config:/root/.aws/config \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --privileged \
     sykescottages/cdk:latest --version
```

Building from this image simply reference it as part of your Dockerfile:

```
FROM sykescottages/cdk:version

# ... Your configuration
```

### Docker Compose

```yaml
version: '3'

services:
    cdk:
        image: sykescottages/cdk:latest
        volumes:
            - .:/code
            - ~/.aws/credentials:/root/.aws/credentials
            - ~/.aws/config:/root/.aws/config
            - /var/run/docker.sock:/var/run/docker.sock
        working_dir: /code
        privileged: true
```

## Testing

All testing is done in the form of a SUT containers which is run by the Docker Hub (see [Automated repository tests](https://docs.docker.com/docker-hub/builds/automated-testing/) for more information) and runs a variety of shell scripts.

## Contributions

Contributions are welcome, but please adhere to the [CONTRIBUTION.MD](https://github.com/SykesCottages/docker-cdk/blob/master/CONTRIBUTION.MD). Also, if you could ensure that there are tests with every modification of the Dockerfiles to verify that your changes work.
