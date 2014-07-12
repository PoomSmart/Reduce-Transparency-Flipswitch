SDKVERSION = 7.0
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

BUNDLE_NAME = ContrastBGToggle
ContrastBGToggle_FILES = Switch.xm
ContrastBGToggle_FRAMEWORKS = UIKit
ContrastBGToggle_LIBRARIES = flipswitch
ContrastBGToggle_INSTALL_PATH = /Library/Switches
ContrastBGToggle_LDFLAGS = -lAccessibility

include $(THEOS_MAKE_PATH)/bundle.mk