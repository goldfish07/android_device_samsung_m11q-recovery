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
TARGET_ARCH := arm64
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_CORTEX_A53 := true

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Platform
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506
TARGET_BOOTLOADER_BOARD_NAME := MSM8953

# Firmware
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_TAGS_OFFSET := 0x01e00000
BOARD_HEADER_VERSION := 2
BOARD_RECOVERY_DTBO_SIZE := 2347796
BOARD_RECOVERY_DTBO_OFFSET := 21106688
BOARD_HEADER_SIZE := 1660
BOARD_DTB_SIZE := 859398
BOARD_DTB_OFFSET := 0x101f00000

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := console=null androidboot.console=ttyMSM0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 androidboot.usbconfigfs=true loop.max_part=7 printk.devkmsg=on
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += \
	--base $(BOARD_KERNEL_BASE) \
	--pagesize $(BOARD_KERNEL_PAGESIZE) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--tags_offset $(BOARD_TAGS_OFFSET) \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--second_offset $(BOARD_SECOND_OFFSET) \
	--dtb_offset $(BOARD_DTB_OFFSET) \
	--dtbsize $(BOARD_DTB_SIZE) \
	--header_version $(BOARD_HEADER_VERSION) \
	--headersize $(BOARD_HEADER_SIZE) 

# Kernel config
TARGET_KERNEL_SOURCE := kernel/samsung/m11q
TARGET_KERNEL_CONFIG := m11q_defconfig

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432 #62
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 #61
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2742513664 #dm-0
BOARD_USERDATAIMAGE_PARTITION_SIZE := 56491978752 #78 56491995136 - 16384
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800 #43
BOARD_VENDORIMAGE_PARTITION_SIZE := 574230528 #dm-1
BOARD_PERSISTIMAGE_PARTITION_SIZE := 1048576 #31
BOARD_FLASH_BLOCK_SIZE := 131072

# Use these flags if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# system as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_ARGS=--padding_size 4096
BOARD_AVB_VBMETA_KEY_PATH=external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2
BOARD_AVB_VBMETA_SYSTEM_ARGS=--padding_size 4096 --rollback_index 1604188800
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS=--rollback_index 1
BOARD_AVB_PRODUCT_SERVICES_HASHTREE_ENABLE=true

# Crypto
BOARD_USES_QCOM_FBE_DECRYPTION := true

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