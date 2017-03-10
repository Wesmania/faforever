# Copyright 2016 Igor Kotrasinski
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5} )

inherit distutils-r1

DESCRIPTION="pytest support for PyQt and PySide applications"
HOMEPAGE="http://github.com/pytest-dev/pytest-qt"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT-with-advertising"
KEYWORDS="amd64 ~hppa ~ppc64 x86 amd64-linux x86-linux"
IUSE=""

RDEPEND="dev-python/pytest[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
