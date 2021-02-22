FROM ubuntu:latest

RUN apt update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

# create tools directory
RUN mkdir ~/tools
RUN mkdir ~/work
RUN mkdir ~/work/ctf

# install GDB
RUN apt-get update && apt-get install gdb -y

# install wget & curl
RUN apt-get install wget -y
RUN apt-get update --fix-missing
RUN apt-get install curl -y

# install Python2.7 and Python3
RUN apt-get update && apt-get install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-add-repository universe \
    && apt-get update
RUN apt-get update && apt-get install -y python2 python2-dev \
    && cd /tmp \
    && wget https://bootstrap.pypa.io/2.7/get-pip.py \
    && python2 get-pip.py \
    && ln -sfn /usr/bin/pip /usr/local/lib/python2.7/dist-packages/pip

RUN apt-get update && apt-get install -y python3.6 python3.6-dev python3-pip

RUN ln -sfn /usr/bin/python3.6 /usr/bin/python3 && ln -sfn /usr/bin/python2 /usr/bin/python

RUN pip install --upgrade "pip < 21.0"
RUN pip install setuptools

RUN apt-get update

RUN pip3 install --upgrade pip
RUN pip3 install setuptools

RUN apt update \
    && apt -y install --no-install-recommends gcc-multilib g++-multilib \
    && apt clean

# libc6-dbg & 32-bit libs
RUN dpkg --add-architecture i386 \
    && apt update \
    && apt -y install --no-install-recommends xz-utils libc6-dbg libc6-dbg:i386 libc6:i386 glibc-source \
    && apt clean \
    && tar -C /usr/src/glibc/ -xf /usr/src/glibc/glibc-*.tar.xz

# install git
RUN apt install git-all -y \
    && apt-get update

# install zip
RUN apt-get install unzip -y

# install gem
RUN apt-get install -y ruby ruby-dev \
    && apt-get update

# install nasm
RUN apt-get install nasm

# jinja2
RUN pip3 install jinja2

# install pwntools & ropper & one_gadget
RUN pip install pwntools
RUN pip3 install pwntools
RUN pip install ropper
RUN pip install one_gadget
RUN gem install one_gadget

RUN apt update \
    && apt -y install --no-install-recommends e2tools qemu \
    && apt clean

# Binwalk
RUN cd /root/tools \
    && git clone --depth 1 https://github.com/devttys0/binwalk && cd binwalk \
    && python3 setup.py install

# Vim
RUN apt-get install vim -y

# Patchelf
RUN apt-get install patchelf

# Ltrace & Strace
RUN apt-get install -y strace ltrace

# Netcat & Socat
RUN apt-get install -y netcat socat

# SecComp
RUN apt-get install -y libseccomp-dev 
RUN gem install seccomp-tools

# Peda GDB & PwnGDB & HeapSim
WORKDIR /root/tools
RUN git clone https://github.com/longld/peda.git ./peda \
    && echo "source ~/tools/peda/peda.py" >> ~/.gdbinit \
    && git clone https://github.com/scwuaptx/Pwngdb.git \
    && echo "source ~/tools/Pwngdb/pwngdb.py" >> ~/.gdbinit \
    && echo "source ~/tools/Pwngdb/angelheap/gdbinit.py" >> ~/.gdbinit \
    && echo "define hook-run" >> ~/.gdbinit \
    && echo "python" >> ~/.gdbinit \
    && echo "import angelheap" >> ~/.gdbinit \
    && echo "angelheap.init_angelheap()" >> ~/.gdbinit \
    && echo "end" >> ~/.gdbinit \
    && echo "end" >> ~/.gdbinit


# Exploit Template
RUN mkdir /root/tools/make_exploit \
    && cd /root/tools/make_exploit \
    && wget https://raw.githubusercontent.com/Fineas/Me-CTF/master/Make%20Exploit/solve_binaries.py \
    && wget https://raw.githubusercontent.com/Fineas/Me-CTF/master/Make%20Exploit/generate_exploit.py \
    && echo "alias SCRIPT=\"python3 ~/tools/make_exploit/generate_exploit.py\"" >> ~/.bashrc

# Libc
RUN mkdir /root/tools/glibc

COPY --from=skysider/glibc_builder64:2.19 /glibc/2.19/64 /root/glibc/2.19/64
COPY --from=skysider/glibc_builder32:2.19 /glibc/2.19/32 /root/glibc/2.19/32

COPY --from=skysider/glibc_builder64:2.23 /glibc/2.23/64 /root/glibc/2.23/64
COPY --from=skysider/glibc_builder32:2.23 /glibc/2.23/32 /root/glibc/2.23/32

COPY --from=skysider/glibc_builder64:2.24 /glibc/2.24/64 /root/glibc/2.24/64
COPY --from=skysider/glibc_builder32:2.24 /glibc/2.24/32 /root/glibc/2.24/32

COPY --from=skysider/glibc_builder64:2.27 /glibc/2.27/64 /root/glibc/2.27/64
COPY --from=skysider/glibc_builder32:2.27 /glibc/2.27/32 /root/glibc/2.27/32

COPY --from=skysider/glibc_builder64:2.28 /glibc/2.28/64 /root/glibc/2.28/64
COPY --from=skysider/glibc_builder32:2.28 /glibc/2.28/32 /root/glibc/2.28/32

COPY --from=skysider/glibc_builder64:2.29 /glibc/2.29/64 /root/glibc/2.29/64
COPY --from=skysider/glibc_builder32:2.29 /glibc/2.29/32 /root/glibc/2.29/32

COPY --from=skysider/glibc_builder64:2.30 /glibc/2.30/64 /root/glibc/2.30/64
COPY --from=skysider/glibc_builder32:2.30 /glibc/2.30/32 /root/glibc/2.30/32

# Tmux
RUN apt-get update
RUN apt-get install -y tmux
RUN echo "PS1='\[\e[32m[\u@\h - \@]\] \[\e[36m\w\] \[\e[33m\]\[\e[1m\]$ \[\e[0m\]'" >> ~/.bashrc

WORKDIR /root