# Copyright 2017 Igor Kotrasinski
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5


PYTHON_COMPAT=( python2_7 python3_5 )

inherit distutils-r1

DESCRIPTION="Utility library for FAF client and server"
HOMEPAGE="https://github.com/FAForever/faftools"
GIT_REPO_URI="https://github.com/FAForever/faftools/archive"
GIT_COMMIT="982073d556b43963e6fc9f6356aad484416d8b84"
SRC_URI="${GIT_REPO_URI}/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

# Git archive folder name
S="${WORKDIR}/faftools-${GIT_COMMIT}"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~hppa ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""
RESTRICT="mirror"

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