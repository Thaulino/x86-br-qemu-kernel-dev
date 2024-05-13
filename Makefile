SHELL := bash

INSTALLER_DEFAULT=sudo apt-get install
ifeq ($(INSTALLER),)
INSTALLER:=$(INSTALLER_DEFAULT)
$(info No Installer provided, using default: <$(INSTALLER)>)
endif

BR_ARCHIV_DEFAULT=buildroot-2025.05.tar.gz
ifeq ($(BR_ARCHIV),)
BR_ARCHIV:=$(BR_ARCHIV_DEFAULT)
endif

BR_PKG_LIST=\
sed make binutils \
build-essential diffutils gcc g++ \
bash patch gzip bzip2 perl \
tar cpio unzip rsync file \
bc findutils wget python3 \
git \
libncurses5-dev libncursesw5-dev

QEMU_PKG_LIST=\
qemu-system-x86	      


setup: .done.setup

.done.setup : .done.br_dependencies .done.br_install  .done.qemu_install
	touch $@

.done.qemu_install : 
	$(INSTALLER) $(QEMU_PKG_LIST) && touch $@

.done.br_dependencies : 
	$(INSTALLER) $(BR_PKG_LIST) && touch $@

# install wget first
.done.br_install: .done.br_dependencies
	mkdir -p buildroot && \
	cd buildroot && \
	wget https://buildroot.org/downloads/$(BR_ARCHIV) -O buildroot.tar.gz && \
	tar -xf buildroot.tar.gz --strip-components=1 && \
	rm buildroot.tar.gz && \
	cd .. && touch $@
	
clean: 
	rm -f .done.setup
	rm -f .done.br_dependencies
	rm -f .done.br_install
	rm -f .done.qemu_install
	rm -rf buildroot

define HELP_MSG
Targets:
	setup 	: install dependencies for br (default)
	clean	: clean
	help	: print this help text

Variables:
	INSTALLER	: Set a custom install command, defaults to '$(INSTALLER_DEFAULT)'
			  INSTALLER='$(INSTALLER_DEFAULT)' make setup 

	BR_ARCHIV	: Set a custom buildroot archiv, defaults to '$(BR_ARCHIV_DEFAULT)'
	
endef

export HELP_MSG
	
help: 
	@echo "$$HELP_MSG"

.PHONY: clean help setup

