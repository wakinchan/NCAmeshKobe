ARCHS = armv7
THEOS_DEVICE_IP = 192.168.1.111
TARGET = iphone:clang::5.0
GO_EASY_ON_ME=1

include theos/makefiles/common.mk

BUNDLE_NAME = NCAmeshKobe
NCAmeshKobe_FILES = NCAmeshKobeController.m
NCAmeshKobe_INSTALL_PATH = /Library/WeeLoader/Plugins
NCAmeshKobe_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"

real-clean:
	rm -rf _
	rm -rf .obj
	rm -rf .theos
	rm -rf *.deb
