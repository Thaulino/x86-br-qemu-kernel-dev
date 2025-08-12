SHELL := /usr/bin/env bash

# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG),y)
  DEBFLAGS = -O -g -DSNULL_DEBUG # "-O" is needed to expand inlines
else
  DEBFLAGS = -O2
endif

EXTRA_CFLAGS += $(DEBFLAGS)
EXTRA_CFLAGS += -I..

ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m  := snull.o

else

ifeq ($(BR2_SHELL_DIR),)
$(error "This Makefile is meant to be run from br2 shell, run ./br2.shell")
endif

$(info $(BR2_SHELL_DIR))

ifneq ($(KERNELDIR),)
$(info "KDIR=$(KERNELDIR) (KERNELDIR)")
KDIR=$(KERNELDIR)
endif

ifeq ($(KDIR),)
$(error "KDIR not set" )
endif

default: snull.ko

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions *.mod modules.order *.symvers

snull.ko: snull.c
	$(MAKE) -C $(KDIR) M=$$PWD

qemu_running: 
	pushd $(BR2_SHELL_DIR) && source $(BR2_SHELL_SCRIPT) && popd && br2ssh "touch /tmp/tmp"

deploy: snull.ko qemu_running
	pushd $(BR2_SHELL_DIR) && source $(BR2_SHELL_SCRIPT) && popd && br2scp snull.ko /opt/modules
	pushd $(BR2_SHELL_DIR) && source $(BR2_SHELL_SCRIPT) && popd && br2ssh depmod

# intellisense:
	



clean: 
	rm -f .*.cmd
	rm -f *.mod.cmd
	rm -f *.mod.c
	rm -f *.ko
	rm -f *.mod
	rm -f *.o
	rm -f *.symvers
	rm -f *.order

# Module specific targets

define HELP_MSG
	snull: 	snull module
	default: 		default module
	intellisense: clangd based intellisense (compile_commands.json)
endef

export HELP_MSG

help:
	@echo "$$HELP_MSG"


.PHONY: help qemu_running deploy intellisense
endif

