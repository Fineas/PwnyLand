```
        __ _.--..--._ _                                        
     .-' _/   _/\_   \_'-.                                  
    |__ /   _/\__/\_   \__|                                 
       |___/\_\__/  \___|                                      
              \__/                                               
              \__/                                               
               \__/   ██████  ██     ██ ███    ██ ██    ██ ██       █████  ███    ██ ██████  
                \__/  ██   ██ ██     ██ ████   ██  ██  ██  ██      ██   ██ ████   ██ ██   ██ 
             ____\__/ ██████  ██  █  ██ ██ ██  ██   ████   ██      ███████ ██ ██  ██ ██   ██ 
       . - '          ██' - . ██ ███ ██ ██  ██ ██    ██    ██      ██   ██ ██  ██ ██ ██   ██ 
      /               ██     \ ███ ███  ██   ████    ██    ███████ ██   ██ ██   ████ ██████  
~~~~~~~  ~~~~~ ~~~~~  ~~~ ~~~  ~~~~~ ~~~~~~~  ~~~~~ ~~~~~  ~~~ ~~~  ~~~~~ ~~~~~~~  ~~~~~ ~~~~~  ~~~
```
> A stacked docker environment for solving CTF PWN challenges.

### 🌴 Setup & Ussage:
```bash
# clone the repository
cd  $PATH
git clone git@github.com:Fineas/PwnyLand.git

# build the docker image
./ubuntu16/build.sh

# add the following lines to ~/.bashrc
alias pwnu16="$PATH/ubuntu16/stop.sh; $PATH/ubuntu16/start.sh; $PATH/ubuntu16/connect.sh;"

# start and connect to a container
pwnu16
```

### 🌴 Features:
* Automatic binary analyzer and script generation ( more information can be found [here](https://github.com/Fineas/Me-CTF/tree/master/Make%20Exploit) )
    ```
    Ussage: SCRIPT -b binary_name.elf -l libc.so.6 -ip 127.0.0.1 -p 1337
    ```
* Compiled Glibc and a [Glibc Builder]()
    ```
    Ussage: ~/tools/glibc/<version> or ~/tools/glibc/builder.py 
    ```
* Wide variety of tools:
    - [pwntools](https://github.com/Gallopsled/pwntools) ⟶ "CTF framework and exploit development library"
    - [ropper](https://github.com/sashs/Ropper) ⟶ "search for gadgets to build rop chains for different architectures"
    - [one_gadget](https://github.com/david942j/one_gadget) ⟶ "one-gadget RCE `execve('/bin/sh', NULL, NULL)` "
    - [peda](https://github.com/longld/peda) ⟶ "Python Exploit Development Assistance for GDB"
    - [Pwngdb](https://github.com/scwuaptx/Pwngdb) ⟶ "GDB for pwn"
    - [radare2](https://github.com/radareorg/radare2) ⟶ "forensics tool, hexadecimal editor, disassembling code, debugging programs"
    - [ltrace](https://man7.org/linux/man-pages/man1/ltrace.1.html) ⟶ "program that intercepts and records the dynamic library calls"
    - [strace](https://man7.org/linux/man-pages/man1/strace.1.html) ⟶ "intercepts and records the system calls which are called by a process"
    - [seccomp-tools](https://github.com/david942j/seccomp-tools) ⟶ "tools for seccomp analysis"
    - [patchelf](https://github.com/NixOS/patchelf) ⟶ "utility for modifying existing ELF executables and libraries"
    - [binwalk](https://github.com/ReFirmLabs/binwalk) ⟶ "tool for analyzing, reverse engineering, and extracting firmware images"

### 🌴 Contributions:
