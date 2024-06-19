FROM summerwind/actions-runner:latest as runner
RUN whoami && exit 1
USER root
RUN apt-get update -y
RUN apt-get install -y openssh-client qemu-system podman xz-utils
USER runner
RUN podman machine init


