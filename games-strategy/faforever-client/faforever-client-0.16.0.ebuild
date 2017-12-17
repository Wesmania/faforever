# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python3_{4,5} )

inherit distutils-r1 versionator
MY_PV=$(replace_version_separator 3 '-')
MY_PV=${MY_PV/rc/rc.}
MY_P=${PN}-${MY_PV}

DESCRIPTION="Community client for Supreme Commander: Forged Alliance"
HOMEPAGE="https://faforever.com"
SRC_URI="https://github.com/FAForever/client/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

# Package uses nonstandard name for the folder
S="${WORKDIR}/client-${MY_PV}"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="amd64"
IUSE=""
#Don't check gentoo mirrors for FAF
RESTRICT="mirror"

RDEPEND="
	>=games-strategy/faf-uid-4.0.4

	virtual/python-ipaddress[${PYTHON_USEDEP}]
	dev-python/semantic_version[${PYTHON_USEDEP}]

	dev-python/PyQt5[${PYTHON_USEDEP},webengine]
	dev-util/xdelta:3
	"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

pkg_setup() {
	export FAF_WORKDIR="/usr/share/games/fafclient"
}

src_prepare() {
	# FIXME - we're waiting for updater patches to go upstream

	# No need to build tests
	# FIXME - should it be dealt with more gracefully?
	rm -rf "${S}/tests"

	# Hardcode the proper workdir
	sed -i "s@UNIX_SHARE_PATH = '/usr/share/fafclient'@UNIX_SHARE_PATH = '${FAF_WORKDIR}'@" \
		   "${S}/src/fafpath.py" || die

	# This is the name used in site-packages
	mv "${S}/src" "${S}/fafclient"
	echo "${MY_PV}" > res/RELEASE-VERSION
}

python_compile() {
	FAFCLIENT_VERSION=${MY_PV} distutils-r1_python_compile
}

python_install() {
	FAFCLIENT_VERSION=${MY_PV} distutils-r1_python_install --optimize=1

	python_scriptinto /usr/games/bin
	python_newscript fafclient/__main__.py faforever-client
}

pkg_postinst() {
	if ! has_version "app-emulation/wine" ; then
		elog "You need app-emulation/wine to run the game itself."
		elog "You will still be able to chat and install mods/maps,"
		elog "but you won't be able to join or host games."
	fi
}

src_install() {
	distutils-r1_src_install

	insinto ${FAF_WORKDIR}
	doins -r res/*
}
