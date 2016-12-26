# Copyright 2016 Igor Kotrasinski
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_{5,6,7} python3_{1,2,3} )

inherit distutils-r1

DESCRIPTION="Binary diff and patch using the BSDIFF4-format"
HOMEPAGE="https://github.com/kjd/idna"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~hppa ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
