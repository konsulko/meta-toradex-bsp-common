LICENSE_${PN}-rtl8188eu = "Firmware-rtlwifi_firmware"
LICENSE_${PN}-sd8997 = "Firmware-Marvell"

FILESEXTRAPATHS_append := "${THISDIR}/files:"

SRC_URI_append += "\
		file://sd8997_uapsta.bin \
		"

PACKAGES_prepend = "\
                     ${PN}-rtl8188eu \
                     ${PN}-sd8997 \
                   "
do_install_append() {
    cp ${WORKDIR}/sd8997_uapsta.bin ${D}${nonarch_base_libdir}/firmware/mrvl/
}

FILES_${PN}-rtl8188eu = " \
  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8188eufw.bin \
"
FILES_${PN}-sd8997 = " \
  ${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin \
"
RDEPENDS_${PN}-rtl8188eu += "${PN}-rtl-license"
RDEPENDS_${PN}-sd8997 += "${PN}-marvell-license"
