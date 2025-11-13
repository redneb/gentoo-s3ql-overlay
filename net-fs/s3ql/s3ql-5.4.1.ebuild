EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="A full-featured FUSE filesystem for online data storage"
HOMEPAGE="https://github.com/s3ql/s3ql"
SRC_URI="$(pypi_sdist_url)"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="contrib"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	sys-fs/fuse:3
	>=dev-python/apsw-3.42.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
	dev-python/google-auth-oauthlib[${PYTHON_USEDEP}]
	>=dev-python/trio-0.15[${PYTHON_USEDEP}]
	>=dev-python/pyfuse3-3.2.0[${PYTHON_USEDEP}]
	<dev-python/pyfuse3-4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"

RESTRICT="test"

DOCS=( README.rst )

src_install() {
	distutils-r1_src_install

	doman doc/manpages/*.1 || die

	if use contrib; then
		exeinto /usr/share/doc/${PF}/contrib
		docompress -x /usr/share/doc/${PF}/contrib
		doexe contrib/*.{py,sh} || die
		doman contrib/*.1 || die
	fi
}
