# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/samsung/m11q/BoardConfigVendor.mk
LOCAL_PATH := device/samsung/m11q

BUILD_BROKEN_DUP_RULES := true

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

# Platform
TARGET_BOARD_PLATFORM := unknown
TARGET_BOOTLOADER_BOARD_NAME := m11q

# Firmware
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_BASE := 0x80000000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_TAGS_OFFSET := 0x01e00000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := console=null androidboot.console=ttyMSM0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 androidboot.usbconfigfs=true loop.max_part=7 printk.devkmsg=on
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# Kernel config
TARGET_KERNEL_SOURCE := kernel/samsung/m11q
TARGET_KERNEL_CONFIG := m11q_defconfig

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432 #25
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 #26
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3397386240 #40
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57415790592 #43 57415806976 - 16384
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800 #43
BOARD_VENDORIMAGE_PARTITION_SIZE := 503316480 #41
BOARD_PERSISTIMAGE_PARTITION_SIZE := 1048576 #31
BOARD_FLASH_BLOCK_SIZE := 131072

# Use these flags if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# system as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Vendor separation
TARGET_COPY_OUT_VENDOR := vendor

BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_OTA_ASSERT_DEVICE := m11q

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab

# filesystem
TARGET_USES_MKE2FS:=true
include $(LOCAL_PATH)/twrp.mk