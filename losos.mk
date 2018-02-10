LOCAL_PATH := $(call my-dir)

# Init scripts

#include $(CLEAR_VARS)
#LOCAL_MODULE            := init.losos_g3.rc
#LOCAL_MODULE_TAGS       := optional eng
#LOCAL_MODULE_CLASS      := ETC
#LOCAL_SRC_FILES         := etc/init.g3.rc
#LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
#include $(BUILD_PREBUILT)

#include $(CLEAR_VARS)
#LOCAL_MODULE            := init.voltages.sh
#LOCAL_MODULE_TAGS       := optional eng
#LOCAL_MODULE_CLASS      := ETC
#LOCAL_SRC_FILES         := etc/init.voltages.sh
#LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
#include $(BUILD_PREBUILT)


LOCAL_CFLAGS += -DCAMCORDER_GRALLOC_SOURCE



# DU Utils Library
PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils \

# DU Utils Package
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils \
    
    
#disable bloody lineage-sdk

TARGET_DISABLE_LINEAGE_SDK := true

# Ramdisk
PRODUCT_PACKAGES += \
    init.g3.rc \
    init.voltages.sh


#Add stuff:
PRODUCT_PACKAGES += \
	Terminal \
	EvieLauncher \
	Brave \
	SwiftKey \
	Substratum \
	TVRemote \
	Clock \
	ClockWidget \
	Music \
	Weather \
	LososConfigurator \
	DU-Tweaks \
	Adaway \
	Mail \
	STC \
	DarkTheme \
	OmniJaws \
	OmniStyle \
	Snap
