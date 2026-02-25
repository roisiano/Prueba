PKG_NAME="astra-sm"
PKG_VERSION="master"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/crazycat69/astra-sm"
PKG_URL="https://github.com/crazycat69/astra-sm/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="astra-sm: lightweight DVB/TS streaming engine"
PKG_LONGDESC="astra-sm is a lightweight streaming engine for DVB and TS processing."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="astra-sm"
PKG_ADDON_TYPE="xbmc.service"

PKG_TOOLCHAIN="autotools"

addon() {
  mkdir -p ${ADDON_BUILD}/bin
  cp ${PKG_BUILD}/src/astra-sm ${ADDON_BUILD}/bin/

  mkdir -p ${ADDON_BUILD}/config
  mkdir -p ${ADDON_BUILD}/service
  mkdir -p ${ADDON_BUILD}/resources

  cp ${PKG_DIR}/addon.xml ${ADDON_BUILD}/
  cp ${PKG_DIR}/service.sh ${ADDON_BUILD}/service/
  cp ${PKG_DIR}/resources/settings.xml ${ADDON_BUILD}/resources/
}

configure_target() {
  ./autogen.sh
  ./configure \
    --host=${TARGET_NAME} \
    --prefix=/usr \
    --without-check \
    --without-ffmpeg \
    --without-libaio \
    --without-lua
}

makeinstall_target() {
  :
}

