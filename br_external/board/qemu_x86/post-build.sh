#!/usr/bin/env bash

set -e 
set -x
set -o pipefail
set -u


# buildroot config 
eval $( cat ${BR2_CONFIG} | grep BR2_LINUX_KERNEL_VERSION )

if [ -z "${BR2_LINUX_KERNEL_VERSION}" ]
then 
    echo "Set BR2_LINUX_KERNEL_VERSION failed"
    exit 1
fi

# Root dir target
# TARGET_DIR
mkdir -p "${TARGET_DIR}/lib/modules/${BR2_LINUX_KERNEL_VERSION}/extra"

pushd "${TARGET_DIR}" > /dev/null 
rm -f ./opt/modules
ln -s "/lib/modules/${BR2_LINUX_KERNEL_VERSION}/extra" "opt/modules"
popd > /dev/null


