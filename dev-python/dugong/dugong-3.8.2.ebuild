# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Python library for communicating with HTTP 1.1 servers"
HOMEPAGE="https://github.com/python-dugong/python-dugong/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc examples test"
RESTRICT="!test? ( test )"

BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-3.4.0[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v || die "Tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/html/. )
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
