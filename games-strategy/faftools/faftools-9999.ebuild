# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_5 )

inherit distutils-r1 git-r3

DESCRIPTION="Utility library for FAF client and server"
HOMEPAGE="https://github.com/FAForever/faftools"
EGIT_REPO_URI="git://github.com/FAForever/faftools.git"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="-amd64 -x86 -amd64-linux -x86-linux"
IUSE=""

RDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/lupa[${PYTHON_USEDEP}]
	dev-python/marshmallow[${PYTHON_USEDEP}]
	dev-python/marshmallow-jsonapi[${PYTHON_USEDEP}]
	virtual/python-pathlib[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	# No need to build tests
	# FIXME - should it be dealt with more gracefully?
	rm -rf "${S}/tests"
}
