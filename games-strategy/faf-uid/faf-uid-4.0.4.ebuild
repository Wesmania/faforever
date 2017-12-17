# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Unique ID generation tool for FAF to prevent smurfing"
HOMEPAGE="https://github.com/FAForever/uid"
SRC_URI="https://github.com/FAForever/uid/releases/download/v${PV}/faf-uid -> ${P}"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="-* amd64"
IUSE=""
RESTRICT="mirror"

# Used to generate the UID
# Need util-linux-2.27 for --json option in lsblk
RDEPEND="
	x11-apps/xrandr
	sys-apps/pciutils
	>=sys-apps/util-linux-2.27
	sys-apps/coreutils"
DEPEND=""

src_unpack() {
	mkdir -p "${S}"
	cp "${DISTDIR}/${A}" "${S}/faf-uid" || die
}

src_install() {
	exeinto /usr/games/bin
	doexe faf-uid
}
