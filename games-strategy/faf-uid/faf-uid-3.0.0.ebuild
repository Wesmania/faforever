# Copyright 2016 Igor Kotrasinski
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Unique ID generation tool for FAF to prevent smurfing"
HOMEPAGE="https://github.com/FAForever/uid"
SRC_URI="https://github.com/FAForever/uid/releases/download/v${PV}/faf-uid"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE=""

# Used to generate the UID
RDEPEND="x11-apps/xrandr sys-apps/pciutils sys-apps/util-linux sys-apps/coreutils"
DEPEND=""

src_unpack() {
	mkdir -p ${S}
	cp "${DISTDIR}/${A}" ${S} || die
}

src_install() {
	exeinto /usr/games/bin
	doexe faf-uid
}
