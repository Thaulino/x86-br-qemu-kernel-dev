MK_PATH_FOO := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

define FOO_BUILD_CMDS
    mkdir -p $(@D)/build;
    mkdir -p $(@D)/staging;
    echo "$(@D)";
endef

define FOO_INSTALL_TARGET_CMDS
    echo $(@D);
    echo $(shell pwd);
    echo $(MK_PATH_FOO);
endef

$(eval $(generic-package))