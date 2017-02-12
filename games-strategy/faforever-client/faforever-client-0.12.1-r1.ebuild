# Copyright 2017 Igor Kotrasinski
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5


PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Community client for Supreme Commander: Forged Alliance"
HOMEPAGE="https://faforever.com"
SRC_URI="https://github.com/FAForever/client/archive/${PV}.tar.gz -> ${P}.tar.gz"

# Package uses nonstandard name for the folder
S="${WORKDIR}/client-${PV}"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
#Don't check gentoo mirrors for FAF
RESTRICT="mirror"

RDEPEND="
	=games-strategy/faftools-0.12.1-r1[${PYTHON_USEDEP}]
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

	dev-python/PyQt4[${PYTHON_USEDEP},webkit]
	dev-util/xdelta:3
	"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

pkg_setup() {
	export FAF_WORKDIR="/usr/share/games/fafclient"
}

src_prepare() {

	epatch "${FILESDIR}"/${P}-01new-updater-message.patch

	# No need to build tests
	# FIXME - should it be dealt with more gracefully?
	rm -rf "${S}/tests"

	# Hardcode the proper workdir
	sed -i "s@UNIX_SHARE_PATH = '/usr/share/fafclient'@UNIX_SHARE_PATH = '${FAF_WORKDIR}'@" \
		   "${S}/src/fafpath.py" || die

	# This is the name used in site-packages
	mv "${S}/src" "${S}/fafclient"
	echo "${PV}" > res/RELEASE-VERSION
}

python_compile() {
	FAFCLIENT_VERSION=${PV} distutils-r1_python_compile
}

python_install() {
	FAFCLIENT_VERSION=${PV} distutils-r1_python_install --optimize=1

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
