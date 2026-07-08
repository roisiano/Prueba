#
# Astra-SM para CoreELEC + Entware
# Versión con Lua, ffmpeg y libaio activados
#

include $(TOPDIR)/rules.mk

PKG_NAME:=astra-sm
PKG_VERSION:=0.2.88
PKG_RELEASE:=5

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=450d4ec79dcb9f267784a42484fcf65b36230b78
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.com/berdyansk/astra-sm.git
PKG_MIRROR_HASH:=251c2d1c0b1547fadfb7d01bfbbc8caea8d790f89a6050cb068adeabe13b2ccd

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/astra-sm
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=Astra SM IPTV server for Linux (CoreELEC build)
  DEPENDS:=+libdvbcsa +libopenssl +liblua5.3 +libaio +ffmpeg
  URL:=https://gitlab.com/berdyansk/astra-sm
  PKGARCH:=aarch64
endef

define Package/astra-sm/description
  Astra SM es un servidor IPTV profesional para operadores DVB/IPTV.
  Esta versión está compilada para CoreELEC + Entware con soporte Lua, ffmpeg y libaio.
endef

TARGET_CFLAGS += -I$(PKG_BUILD_DIR)/lua -pthread
TARGET_LDFLAGS += -L$(PKG_BUILD_DIR)/lua/.libs

CONFIGURE_ARGS += \
    --with-ffmpeg \
    --with-libaio \
    --with-lua

define Package/astra-sm/postinst
#!/bin/sh
ln -sfn /opt/etc/init.d/S55astra /opt/etc/default/usb_services/dvb/S55astra
endef

define Package/astra-sm/postrm
#!/bin/sh
rm -rf /opt/etc/default/usb_services/dvb/S55astra
endef

define Package/astra-sm/install
    $(INSTALL_DIR) $(1)/opt/share/astra
    $(INSTALL_DIR) $(1)/opt/etc/astra/scripts
    $(CP) ./files/sat_mx1-t2mi.lua $(1)/opt/etc/astra/scripts/
    $(INSTALL_DIR) $(1)/opt/etc/default/usb_services/dvb
    $(INSTALL_DIR) $(1)/opt/bin
    $(INSTALL_BIN) $(PKG_BUILD_DIR)/src/astra $(1)/opt/bin/
    $(INSTALL_BIN) $(PKG_BUILD_DIR)/tests/t2mi_decap $(1)/opt/bin/
    $(INSTALL_DIR) $(1)/opt/etc/init.d
    $(CP) ./files/S55astra $(1)/opt/etc/init.d/
endef

$(eval $(call BuildPackage,astra-sm))

