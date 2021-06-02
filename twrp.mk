TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/soc/7000000.ssusb/7000000.dwc3/gadget/lun%d/file"

RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888" #"ABGR_8888"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_CUSTOM_BATTERY_PATH := "/sys/devices/battery/power_supply/battery"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone1/temp"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true

TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_NTFS_3G := true
TW_EXTRA_LANGUAGES := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_DEVICE_VERSION := goldfish07(Ayush Bisht)
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#TW_EXCLUDE_DEFAULT_USB_INIT := true

#TW_HAS_MTP := true
#TW_MTP_DEVICE := /dev/usb_mtp_gadget

TW_EXCLUDE_TWRPAPP := true

TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Crypto
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := true

PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab