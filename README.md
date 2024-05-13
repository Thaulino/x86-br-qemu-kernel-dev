# x86-br-qemu-kernel-dev

buildroot external project for qemu based kernel fun or your own embedded project

## Prequisition

* clone project into \<x86-br-qemu-root>

You may need to install some more software, the initial setup will guide you through the process.

## Introduction

* ``` make -C <x86-br-qemu-root> ```

After you have done the initial setup, start the br2 shell in bash by 
```
cd <x86-br-qemu-root>  && ./br2.shell.run
```

Warning: Only bash is tested !!! 

br2-shell:
```
> (br2):<your-prompt>
```

Inside the shell multiple commands are predefined, check out ```br2.shell``` for details. 
The common ones: 

* br2vars, show all predefined variables
* br2init, initialize buildroot should be done at least once
* br2make <target>, call make within buildroot project and build <target>
You can pass all targets defined in mainstream buildroot like: 
   * help
   * world 
   * menuconfig
   * linux 
* br2qemu, run linux in qemu
* br2ssh, connect to running qemu 
* br2scp, copy file to qemu

## Quickstart

The following steps are needed to connect to the linux running in qemu.

```
# install prequisitions and run br2 shell
cd <x86-br-qemu-root>  && make && ./br2.shell.run
# init br2-shell
br2init
# build linux, rootfs and sdk 
br2make world
# run qemu
br2qemu
...
Welcome to Buildroot
buildroot login: root
```

Hint #1: login as root  
Hint #2: ctr-a x, stops qemu