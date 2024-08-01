# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq bastet && \
#     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/


FROM alpine:3.18.2
USER root
RUN apk add --no-cache \
        # Needed for Gitpod compatibility:
        git\
        # git-lfs \ # uncomment if needed
        bash \
        sudo  \
        docker \
        iptables\
        # Needed for VSCode compatibility:
        libgcc \
        gcompat \
        libstdc++\
	      neovim \
    # Add gitpod user
    && echo '%gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod \
    && addgroup -g 33333 gitpod && adduser -u 33333 -G gitpod -h /home/gitpod -s /bin/bash -D gitpod

USER gitpod
ENTRYPOINT [ "bash" ]
