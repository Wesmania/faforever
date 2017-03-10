# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_{5,6,7} python3_{1,2,3} )

inherit distutils-r1

DESCRIPTION="An implementation of the TrueSkill algorithm for Python"
HOMEPAGE="http://trueskill.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="amd64 ~hppa ~ppc64 x86 amd64-linux x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
