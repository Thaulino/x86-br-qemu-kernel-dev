################################################################################
#
# snull
#
################################################################################

SNULL_VERSION = 1.2.3
SNULL_SITE_METHOD = local
SNULL_SITE = $(BR2_EXTERNAL_QEMU_KERNEL_DEV_PATH)/../modules/snull
SNULL_LICENSE = GPL-2.0
SNULL_LICENSE_FILES = COPYING

$(eval $(kernel-module))
$(eval $(generic-package))