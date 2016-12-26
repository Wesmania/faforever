# Copyright 2016 Igor Kotrasinski
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_{6,7} python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="JSON API 1.0 (https://jsonapi.org) formatting with marshmallow"
HOMEPAGE="http://marshmallow-jsonapi.readthedocs.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT-with-advertising"
KEYWORDS="~amd64 ~hppa ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-python/marshmallow"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
