# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NODRYRUN="1"
K_NOSETEXTRAVERSION="1"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64 ~x86"
HOMEPAGE="https://github.com/zen-kernel"
IUSE=""

DESCRIPTION="The Zen Kernel Live Sources"

ZEN_URI="https://github.com/zen-kernel/zen-kernel/releases/download/v${PV}-zen1/v${PV}-zen1.patch.xz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${ZEN_URI}"

UNIPATCH_LIST="
	"${DISTDIR}"/v${PV}-zen1.patch.xz
	"${FILESDIR}"/5.18.16/0001-surface3-oemb.patch
	"${FILESDIR}"/5.18.16/0002-mwifiex.patch
	"${FILESDIR}"/5.18.16/0003-ath10k.patch
	"${FILESDIR}"/5.18.16/0004-ipts.patch
	"${FILESDIR}"/5.18.16/0005-surface-sam.patch
	"${FILESDIR}"/5.18.16/0006-surface-sam-over-hid.patch
	"${FILESDIR}"/5.18.16/0007-surface-button.patch
	"${FILESDIR}"/5.18.16/0008-surface-typecover.patch
	"${FILESDIR}"/5.18.16/0009-surface-battery.patch
	"${FILESDIR}"/5.18.16/0010-surface-gpe.patch
	"${FILESDIR}"/5.18.16/0011-cameras.patch
	"${FILESDIR}"/5.18.16/0012-amd-gpio.patch"

UNIPATCH_STRICTORDER="yes"

K_EXTRAEINFO="For more info on zen-sources, and for how to report problems, see: \
${HOMEPAGE}, also go to #zen-sources on oftc"

pkg_setup() {
	ewarn
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the zen developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn
	kernel-2_pkg_setup
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
