# Inception

#### Goal : This project aims to broaden your knowledge of system administration by using Docker.

## What is a Docker Container?

A Docker Container is a sandboxed process on your machine that is isolated from all other processes on the host machine. That isolation leverages kernel namespaces and cgroups, features that have been in Linux for a long time. Docker has worked to make these capabilities approachable and easy to use. To summarize, a container:
* is a runnable instance of an image. You can create, start, stop, move, or delete a container using the DockerAPI or CLI.

* can be run on local machines, virtual machines or deployed to the cloud.

* is portable (can be run on any OS).

* is isolated from other containers and runs its own software, binaries, and configurations.

## What is a Docker Image?

> A Docker image is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files. Docker images are created from a set of instructions, called a Dockerfile, which specify the base image to use, the software and dependencies to install, and any additional configuration settings. Docker images are stored in a registry and can be pulled and run on any host that has Docker installed, making it easy to distribute and deploy applications. When a Docker image is run, it creates a Docker container, which is an instance of the image with its own isolated process and file system.


## Difference between Docker and a VM

| Feature              | Docker                             | VM                                |
|----------------------|-------------------------------------|-------------------------------------|
| Architecture         | Uses containerization approach, runs on top of host OS | Uses hypervisor virtualization, emulates a complete computer system |
| Resource requirements| Lightweight, shares host OS kernel, requires fewer resources | Heavier, requires complete OS, more resource-intensive |
| Performance          | Typically better performance, lower overhead | Higher overhead, lower performance |
| Isolation            | Provides a limited level of isolation, shares host OS kernel | Provides a higher level of isolation, emulates complete system |
| Portability          | Designed to be portable across different environments and platforms | Tied to specific hypervisor or virtualization platform |
| Deployment           | Can be deployed quickly, doesn't require complete OS to be loaded and configured | Requires complete OS to be loaded and configured |
| Management           | Provides a streamlined way to manage containers using a single command-line interface | Requires more complex management tools, such as virtual machine managers or hypervisor management software |


## What is a Docker Network?

> Docker networking is primarily used to establish communication between Docker containers and the outside world via the host machine where the Docker daemon is running.

### Types of Docker Networks

| Type     | Description                                             |
|----------|---------------------------------------------------------|
| bridge   | The default network created when Docker is installed. It allows containers to communicate with each other on the same host. |
| host     | The container shares the host’s network stack, allowing the container to use the host’s networking directly. |
| overlay  | Used for container-to-container communication across multiple Docker hosts in a swarm cluster. |
| macvlan  | Allows you to assign a MAC address to a container, making it appear as a physical device on the network. |
| none     | Disables networking on the container. |


## What is a Docker Volume?

> In Docker, a volume is a way to store data outside of a container's filesystem. A Docker volume is a named storage location that can be shared among one or more containers.

> When you create a volume, Docker creates a directory on the host machine where the volume data is stored. This directory is mounted into the container, so the container can read and write data to the volume.

> Volumes can be used to persist data between container runs, to share data between containers, or to store sensitive data that should not be stored in the container filesystem.

> You can create and manage volumes using the Docker CLI or Docker Compose. Volumes can also be specified in a Dockerfile using the VOLUME instruction.

### Types of Docker Volumes

| Type     | Description                                             |
|----------|---------------------------------------------------------|
| local    | This is the default volume type. It creates a volume on the local filesystem of the Docker host. |
| name     | A named volume is a volume with a user-defined name. It can be created and managed using the docker volume command. |
| anonymous | Anonymous volumes are created by Docker automatically when a container is started if no explicit volume is specified. They are usually used for temporary or disposable data. |
| bind     |  A bind mount is a way to mount a directory from the host filesystem into the container. It can be used to share data between the host and container. |
| tmpfs    | A tmpfs volume is a temporary volume that stores data in memory rather than on disk. It is useful for applications that require fast read/write access to data. |


## What is a Dockerfile?

> A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image.

> Docker runs instructions in a Dockerfile in order. A Dockerfile must begin with a FROM instruction. The FROM instruction specifies the Parent Image from which you are building. FROM may only be preceded by one or more ARG instructions, which declare arguments that are used in FROM lines in the Dockerfile.

<details><summary>Common Dockerfile Instructions</summary>
<p>

FROM Specifies the base image to use as the starting point.

RUN Runs a command in the shell to build the image.

COPY Copies files from host to the image.

EXPOSE Specifies the ports to be exposed by the container.

ENV Sets environment variables in the image.

CMD Specifies the default command to run when a container is started from the image.

ENTRYPOINT Specifies the command that will always be executed when a container is run from the image.

</p>
</details>
