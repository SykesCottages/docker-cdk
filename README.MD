# Sykes Cottages CDK Docker Images

## About

We use a variety of CDK containers at Sykes Cottages across most of our platforms, but due to a lack of official and maintained images we have introduced our own.
All of our CDK images are based off the [Base Sykes](https://github.com/SykesCottages/docker-base) image which uses the official Ubuntu Docker image.
We opted for this path to utilise aptitude so we could manage packages easier and utilise the package integrity verification that comes with apititude.

## Supported versions and available tags

- 1.168.0 (Maintenance) - `sykescottages/cdk:1`
- **2.37.1 (Current)** - `sykescottages/cdk:2`

## Usage

Pulling an image:
```
docker pull sykescottages/cdk:version
```

Running a container:
```
docker run -it sykescottages/cdk:version
```

Building from this image simply reference it as part of your Dockerfile:

```
FROM sykescottages/cdk:version

# ... Your configuration
```

## Testing

All testing is done in the form of a SUT containers which is run by the Docker Hub (see [Automated repository tests](https://docs.docker.com/docker-hub/builds/automated-testing/) for more information) and runs a variety of shell scripts.

## Contributions

Contributions are welcome, but please adhere to the [CONTRIBUTION.MD](https://github.com/SykesCottages/docker-cdk/blob/master/CONTRIBUTION.MD). Also, if you could ensure that there are tests with every modification of the Dockerfiles to verify that your changes work.