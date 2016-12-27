# Copyright 2016 Igor Kotrasinski
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5


PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="Community client for Supreme Commander: Forged Alliance"
HOMEPAGE="https://faforever.com"
EGIT_REPO_URI="git://github.com/FAForever/client.git"
EGIT_COMMIT="0.12.0-pre2"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE=""

# TODO - figure out if we need pulseaudio/apulse
# TODO - figure out if we need use flags from PyQt4
RDEPEND="
	=games-strategy/faftools-0.12[${PYTHON_USEDEP}]
	>=games-strategy/faf-uid-3.0.0

	dev-python/bsdiff4[${PYTHON_USEDEP}]
	dev-python/enum34[${PYTHON_USEDEP}]
	dev-python/lupa[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	virtual/python-ipaddress[${PYTHON_USEDEP}]
	virtual/python-pathlib[${PYTHON_USEDEP}]
	dev-python/ipaddress[${PYTHON_USEDEP}]
	dev-python/py[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/trueskill[${PYTHON_USEDEP}]

	dev-python/PyQt4[${PYTHON_USEDEP}]
	dev-util/xdelta:3
	"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

pkg_setup() {
	distutils-r1_pkg_setup
	git-r3_pkg_setup
	export FAF_WORKDIR="/usr/share/games/fafclient"
}

src_prepare() {

	epatch "${FILESDIR}"/${P}-scriptify-main.patch
	epatch "${FILESDIR}"/${P}-hardcodable-workdir.patch
	epatch "${FILESDIR}"/${P}-skip-lib-in-path.patch

	# No need to build tests
	# FIXME - should it be dealt with more gracefully?
	rm -rf "${S}/tests"

	# Hardcode the proper workdir
	sed -i "s@UNIX_WORKDIR=\"\"@UNIX_WORKDIR=\"${FAF_WORKDIR}\"@" "${S}/src/__main__.py" || die

	# This is the name used in site-packages
	mv "${S}/src" "${S}/fafclient"
}

python_compile() {
	FAFCLIENT_VERSION=${PV} distutils-r1_python_compile
}

python_install() {
	FAFCLIENT_VERSION=${PV} distutils-r1_python_install --optimize=1

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

	echo ${PV} > res/RELEASE-VERSION
	insinto ${FAF_WORKDIR}
	doins -r res/*
}
