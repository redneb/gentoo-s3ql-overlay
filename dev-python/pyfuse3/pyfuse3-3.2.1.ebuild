# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Python 3 bindings for libfuse 3 with asynchronous API (Trio compatible)"
HOMEPAGE="
	https://github.com/libfuse/pyfuse3
	https://pypi.org/project/pyfuse3
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
#SRC_URI="https://github.com/pyfuse3/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	sys-fs/fuse:3
	>=dev-python/trio-0.15[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
