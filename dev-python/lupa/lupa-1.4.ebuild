# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_{6,7} python3_{2,3,4,5} )

inherit distutils-r1

DESCRIPTION="Python wrapper around Lua and LuaJIT"
HOMEPAGE="https://github.com/scoder/lupa"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT-with-advertising"
KEYWORDS="~amd64 ~hppa ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="+luajit"

RDEPEND="
	luajit? ( dev-lang/luajit:2= )
	!luajit? ( dev-lang/lua:0 )"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"


python_compile() {
	if ! use luajit ; then
		LUPA_FLAGS="--no-luajit"
	else
		LUPA_FLAGS=""
	fi
	distutils-r1_python_compile $LUPA_FLAGS
}
