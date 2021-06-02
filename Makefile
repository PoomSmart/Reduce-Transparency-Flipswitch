PACKAGE_VERSION = 1.0.0
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ReduceTransparencyFS
ReduceTransparencyFS_FILES = Switch.xm
ReduceTransparencyFS_FRAMEWORKS = UIKit
ReduceTransparencyFS_LIBRARIES = Accessibility flipswitch
ReduceTransparencyFS_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk
