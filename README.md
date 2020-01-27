# Using SageMaker For ML-Agents

<img src="https://github.com/Unity-Technologies/ml-agents/blob/85faca322c7b378002423423bea2986fbb206659/docs/images/image-banner.png" align="middle" width="3000"/>


Note: This tutorial supports only unity ml-agents v0.11.0.

## Requirements

- Unity _Linux Build Support_ Component
- [Docker](https://www.docker.com)

## Setup

- [Download](https://unity3d.com/get-unity/download) the Unity Installer and add
  the _Linux Build Support_ Component

- [Download](https://www.docker.com/community-edition#/download) and install
  Docker if you don't have it setup on your machine.

- Since Docker runs a container in an environment that is isolated from the host
  machine, a mounted directory in your host machine is used to share data, e.g.
  the trainer configuration file, Unity executable, curriculum files and
  TensorFlow graph. For convenience, we created an empty `unity-volume`
  directory at the root of the repository for this purpose, but feel free to use
  any other directory. The remainder of this guide assumes that the
  `unity-volume` directory is the one used.

## Usage

Using Docker for ML-Agents involves three steps: building the Unity environment
with specific flags, building a Docker container and, finally, running the
container. If you are not familiar with building a Unity environment for
ML-Agents, please read through our [Getting Started with the 3D Balance Ball
Example](https://github.com/Unity-Technologies/ml-agents/blob/master/docs/Getting-Started-with-Balance-Ball.md) guide first.

### Build the Environment (Optional)

_If you want to used the Editor to perform training, you can skip this step._

Since Docker typically runs a container sharing a (linux) kernel with the host
machine, the Unity environment **has** to be built for the **linux platform**.
When building a Unity environment, please select the following options from the
the Build Settings window:

- Set the _Target Platform_ to `Linux`
- Set the _Architecture_ to `x86_64`
- If the environment does not contain visual observations, you can select the
  `headless` option here.

Then click `Build`, pick an environment name (e.g. `3DBall`) and set the output
directory to `unity-volume`. After building, ensure that the file
`<environment-name>.x86_64` and subdirectory `<environment-name>_Data/` are
created under `unity-volume`.

![Build Settings For Docker](https://github.com/Unity-Technologies/ml-agents/blob/85faca322c7b378002423423bea2986fbb206659/docs/images/docker_build_settings.png)

### Upload the Environment to S3

Upload the files under `unity-volume` to your S3 bucket.

### Build the Docker Container

First, make sure the Docker engine is running on your machine. Then build the
Docker container by calling the following command at the top-level of the
repository:

```sh
docker build -t <image-name> .
```

Replace `<image-name>` with a name for the Docker image, e.g.
`balance.ball.v0.1`.

### Push the Docker Image to ECR
Push the docker image you created to AWS ECR.
![Pushing an Image](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html)

### Run SageMaker Training Job
Use the uploaded files as input of SageMaker trainig job. The container performs training on the SageMaker training instance and automatically upload the output to your S3 bucket.
