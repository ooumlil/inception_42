# Inception

## What is a Docker Container?

> A Docker Container is is a sandboxed process on your machine that is isolated from all other processes on the host machine. That isolation leverages kernel namespaces and cgroups, features that have been in Linux for a long time. Docker has worked to make these capabilities approachable and easy to use. To summarize, a container:
* is a runnable instance of an image. You can create, start, stop, move, or delete a container using the DockerAPI or CLI.

* can be run on local machines, virtual machines or deployed to the cloud.

* is portable (can be run on any OS).

* is isolated from other containers and runs its own software, binaries, and configurations.

## What is a Docker Image?

> A Docker image is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files. Docker images are created from a set of instructions, called a Dockerfile, which specify the base image to use, the software and dependencies to install, and any additional configuration settings. Docker images are stored in a registry and can be pulled and run on any host that has Docker installed, making it easy to distribute and deploy applications. When a Docker image is run, it creates a Docker container, which is an instance of the image with its own isolated process and file system.


## What is a Dockerfile?

> A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image.

> Docker runs instructions in a Dockerfile in order. A Dockerfile must begin with a FROM instruction. The FROM instruction specifies the Parent Image from which you are building. FROM may only be preceded by one or more ARG instructions, which declare arguments that are used in FROM lines in the Dockerfile.

<details><summary>Common Dockerfile Instructions</summary>
<p>

FROM Specifies the base image to use as the starting point.

RUN Runs a command in the shell to build the image.

COPY Copies files from host to the image.

WORKDIR Sets the working directory for subsequent instructions.

EXPOSE Specifies the ports to be exposed by the container.

ENV Sets environment variables in the image.

CMD Specifies the default command to run when a container is started from the image.

LABEL Adds metadata to the image.

ADD Similar to COPY, but also supports URL and tar archive extraction.

ENTRYPOINT Specifies the command that will always be executed when a container is run from the image.

VOLUME Creates a mount point for data persistence.

USER Sets the user for the subsequent instructions.

</p>
</details>







## Docker Commands

<details><summary>Build a Container Image</summary>
<p>

```
docker build -t getting-started .
```

The *docker build* command uses the Dockerfile to build a new container image.

The *-t* flag tags your image. Think of this simply as a human-readable name for the final image. Since you named the image getting-started, you can refer to that image when you run a container.

The *.* at the end of the docker build command tells Docker that it should look for the Dockerfile in the current directory.

</p>
</details>

<details><summary>Start a Container Image</summary>
<p>

```
docker run -dp 3000:3000 getting-started
```

You use *docker run* command to start your container

You use the **-d** flag to run the new container in “detached” mode (in the background).

You also use the **-p** flag to create a mapping between the host’s port 3000 to the container’s port 3000.

Without the port mapping, you wouldn’t be able to access the application.

</p>
</details>


<details><summary>List Containers</summary>
<p>

```
docker ps -a
```

the *docker ps* command lists the running containers by default

if you add the flag **-a** you can list all your containers

</p>
</details>

<details><summary>Stop a Container</summary>
<p>

```
docker stop <the-container-id>
```

the *docker stop* command stops the container using ``` <the-container-id> ```

All you got to do is list all your containers ``` docker ps -a ```
and get the id from the __CONTAINER ID__ to remove it

</p>
</details>

<details><summary>Remove a Container</summary>
<p>

```
docker rm -f <the-container-id>
```

the *docker rm* command removes a container, if its used without a flag it can't stop a running container.

the flag **-f** forces removal even if the container is running.

you can remove multiple containers at the same time just by adding ```<the-container-id>```

</p>
</details>

<details><summary>Execute a Command inside a Container</summary>
<p>

```
docker exec <container-id> <command-to-execute>
```

the *docker exec* command allows you to run a command inside a **running** Docker container.

</p>
</details>

<details><summary>Open a Terminal in a Container</summary>
<p>

```
docker run -it <container-id> <preferred-terminal>
```

the flag *-i* and *-t* which stands for *--interactive* and *--tty* .

These options allow the container to run in interactive mode, where you can run commands and see the output in the terminal, and allocate a TTY terminal, which allows for input and output in the terminal.

</p>
</details>
