INSTALL_MOD_DIR := extra
override TARGET_MODULE := p5_dkmshello
override MODULE_PATH := $(realpath $(abspath $(dir $(firstword $(MAKEFILE_LIST)))))

.DEFAULT: default
.PHONY: default clean load unload install dkms $(MODULE_PATH)/$(TARGET_MODULE).ko

KERNEL := $(shell uname -r)
BUILDSYSTEM_PATH := /lib/modules/$(KERNEL)/build
override DKMS_PACKAGE_NAME ?= `sed -n 's/^[[:blank:]]*PACKAGE_NAME=\([^[:blank:]]*\).*/\1/p' dkms.conf`
override DKMS_PACKAGE_VERSION ?= `sed -n 's/^[[:blank:]]*PACKAGE_VERSION=\([^[:blank:]]*\).*/\1/p' dkms.conf`

default: $(MODULE_PATH)/$(TARGET_MODULE).ko

$(MODULE_PATH)/$(TARGET_MODULE).ko:
	# run kernel build system to make module
	$(MAKE) -C "$(BUILDSYSTEM_PATH)" M="$(MODULE_PATH)" modules

clean:
	# run kernel build system to cleanup in current directory
	$(MAKE) -C "$(BUILDSYSTEM_PATH)" M="$(MODULE_PATH)" clean

load: $(MODULE_PATH)/$(TARGET_MODULE).ko
	insmod "$(MODULE_PATH)/$(TARGET_MODULE).ko"

unload: $(MODULE_PATH)/$(TARGET_MODULE).ko
	rmmod "$(MODULE_PATH)/$(TARGET_MODULE).ko"

install:
ifneq ($(KERNELRELEASE),)
	$(MAKE) -C "$(BUILDSYSTEM_PATH)" INSTALL_MOD_DIR="$(INSTALL_MOD_DIR)" M="$(MODULE_PATH)" modules_install
else
	$(MAKE) -C "$(BUILDSYSTEM_PATH)" M="$(MODULE_PATH)" modules_install
endif

dkms:
	dkms add "$(MODULE_PATH)"
	dkms build -m "$(DKMS_PACKAGE_NAME)" -v "$(DKMS_PACKAGE_VERSION)" -k "$(KERNEL)"
	dkms install -m "$(DKMS_PACKAGE_NAME)" -v "$(DKMS_PACKAGE_VERSION)" -k "$(KERNEL)"
