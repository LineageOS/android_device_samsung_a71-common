#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)
$(call inherit-product, hardware/qcom-caf/common/common.mk)

COMMON_PATH := device/samsung/a71-common

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_CHARACTERISTICS := nosdcard
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files \

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl.sm6150 \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    audio.primary.default \
    audio.primary.sm6150:32 \
    audio.r_submix.default \
    audio.usb.default \
    cplay \
    libaudiofoundation \
    libaudioutils \
    libtinyalsa \
    libtinycompress \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay \

# Audio SoundFX
PRODUCT_PACKAGES += \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libvisualizer \
    libvolumelistener:32 \

AUDIO_HAL_DIR := hardware/qcom-caf/sm8150/audio/configs

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(COMMON_PATH)/audio/configs/,$(TARGET_COPY_OUT_VENDOR)/etc/) \
    $(AUDIO_HAL_DIR)/msmsteppe/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(AUDIO_HAL_DIR)/msmsteppe/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/audio_platform_info_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_qrd.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(AUDIO_HAL_DIR)/msmsteppe/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/mixer_paths_wcd9375.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9375.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/mixer_paths_wcd9375qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9375qrd.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/sound_trigger_mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_qrd.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(AUDIO_HAL_DIR)/msmsteppe/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \

# Bluetooth
PRODUCT_PACKAGES += \
    aptxalsOverlay \
    audio.bluetooth.default \

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider-service_32.samsung \

# Charger
PRODUCT_PACKAGES += \
    vendor.lineage.fastcharge@1.0-service.samsung \

# CNE
PRODUCT_PACKAGES += \
    CneApp.libvndfwk_detect_jni.qti_vendor_symlink \

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore \

# Data
$(call inherit-product, vendor/qcom/opensource/dataservices/dataservices_vendor_product.mk)

# Display
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# SamsungAdvancedDisplay
PRODUCT_PACKAGES += \
    AdvancedDisplay \

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze \

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    libcrypto_shim.vendor \

# Fastbootd
TARGET_BOARD_FASTBOOT_INFO_FILE := $(COMMON_PATH)/fastboot-info.txt

PRODUCT_PACKAGES += \
    fastbootd \

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.samsung \

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio \
    qcom.fmradio.xml \

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-hal \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    gralloc.sm6150 \
    hwcomposer.sm6150 \
    vendor.qti.hardware.display.allocator-service \

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.samsung \
    android.hardware.health-service.samsung-recovery \
    vendor.lineage.health-service.default \

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \

# Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-service.samsung \

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.samsung \

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service.samsung-qcom.sm6150 \

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2_sec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2_sec_ape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec_ape.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2_sec_qcp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec_qcp.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2_sec_wmx.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec_wmx.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_performance_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_performance_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v2.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v1.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v2.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_vendor_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_vendor_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v2.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.sm6150 \

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    SecureElement \
    Tag \

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw \

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay \
    $(COMMON_PATH)/overlay-lineage \

# Perf
PRODUCT_PACKAGES += \
    libqti-perfd-client \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.sd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.sd.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti.sm6150 \
    android.hardware.power.stats@1.0-service.mock \

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml \

# Public Libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \

# QTI
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/sysconfig/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml \

PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json \

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom_ramdisk \
    fingerprint_common.rc \
    init.fingerprint.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.samsung.bsp.rc \
    init.samsung.display.rc \
    init.samsung.rc \
    init.target.rc \
    init.vendor.onebinary.rc \
    init.vendor.rilchip.rc \
    init.vendor.rilcommon.rc \
    init.vendor.sensors.rc \
    init.vendor.sysfw.rc \
    ueventd.qcom.rc \
    wifi_qcom.rc \
    wifi_sec.rc \
    init.class_main.sh \
    init.crda.sh \
    init.mdm.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.chg_policy.sh \

# Recovery
AB_OTA_UPDATER := false

PRODUCT_PACKAGES += \
    init.recovery.qcom.rc \

# RIL
PRODUCT_PACKAGES += \
    libsecril-client \
    secril_config_svc \
    sehradiomanager \

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.samsung-multihal \
    libsensorndkbridge \
    libshim_sensorndkbridge \
    sensors.samsung \

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/permissions/com.samsung.permission.SSENSOR.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.samsung.permission.SSENSOR.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/sensors/sns_reg_config:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sns_reg_config \

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH) \
    hardware/qcom-caf/common/libqti-perfd-client \
    hardware/samsung \
    vendor/qcom/opensource/usb/etc \

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \

PRODUCT_BOOT_JARS += \
    telephony-ext \

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.sm6150 \

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service.dual_role_usb \
    android.hardware.usb-service.samsung \

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.samsung \

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    ConnectivityOverlay \
    firmware_WCNSS_qcom_cfg.ini_symlink \
    hostapd \
    libwifi-hal-qcom \
    libwpa_client \
    SoftapOverlay \
    TetheringConfigOverlay \
    WifiOverlay \
    wpa_supplicant \
    wpa_supplicant.conf \

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/indoorchannel.info:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/indoorchannel.info \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/a71-common/a71-common-vendor.mk)
