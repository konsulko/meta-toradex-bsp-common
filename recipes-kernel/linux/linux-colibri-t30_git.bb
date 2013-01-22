inherit kernel
require recipes-kernel/linux/linux.inc

LINUX_VERSION ?= "3.1.10"

SRCREV = "f24053429a62dc1bd812d0f87896830e6e331b9e"

PV = "${LINUX_VERSION}+gitr${SRCREV}"
PR = "V2.0a1"
S = "${WORKDIR}/git"
SRC_URI = "git://git.toradex.com/linux-toradex.git;protocol=git;branch=colibri"

COMPATIBLE_MACHINE = "colibri-t30"

CMDLINE="mem=148M@0M fbmem=12M@148M nvmem=96M@160M vmalloc=248M video=tegrafb root=/dev/nfs ip=:::::eth0:on rw netdevwait mtdparts=tegra_nand:1018368K@28160K(userspace) console=ttyS0,115200n8 usb_high_speed=1"

do_configure_prepend_colibri-t30() {
	#use the defconfig provided in the kernel source tree
	install -m 0644 ${S}/arch/arm/configs/colibri_t30_defconfig ${WORKDIR}/defconfig
}

