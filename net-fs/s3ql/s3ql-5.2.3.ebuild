# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="A full-featured file system for online data storage"
HOMEPAGE="https://github.com/s3ql/s3ql"
SRC_URI="https://github.com/s3ql/s3ql/releases/download/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="contrib doc systemd test"

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	>=dev-python/apsw-3.42.0[${PYTHON_USEDEP}]
	>=dev-python/trio-0.15[${PYTHON_USEDEP}]
	>=dev-python/pyfuse3-3.2.0[${PYTHON_USEDEP}]
	<dev-python/pyfuse3-4.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/google-auth-oauthlib[${PYTHON_USEDEP}]
	systemd? ( dev-python/python-systemd[${PYTHON_USEDEP}] )"
BDEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		net-misc/rsync[xattr]
	)"

RESTRICT="test"

python_configure() {
	esetup.py build_cython
}

python_test() {
	addwrite /dev/fuse
	py.test -v tests || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all

	if use contrib ; then
		exeinto /usr/share/doc/${PF}/contrib
		docompress -x /usr/share/doc/${PF}/contrib
		doexe contrib/*.{py,sh}
		doman contrib/*.1
	fi

	if use doc ; then
		dodoc doc/manual.pdf
		dodoc -r doc/html
	fi
}
