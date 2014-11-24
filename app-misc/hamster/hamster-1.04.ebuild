# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 eutils

DESCRIPTION="The hamster time-tracker"
HOMEPAGE="https://github.com/projecthamster"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/projecthamster/hamster.git"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure () {
	epatch "${FILESDIR}/${PV}-fix_python_env.patch"
	python2 waf configure --prefix="/usr" || die "Configure failed"
}

src_compile () {
	python2 waf build || die "Compile failed"
}

src_install() {
	DESTDIR="${D}" python2 waf install || die "Install failed"
}
