# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="The viber app"
HOMEPAGE="https://www.viber.com"
SRC_URI="http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack () {
	mkdir ${S}
	cd ${S}
	unpack ${A}
}

src_configure () {
	ar x viber.deb
}

src_install() {
	tar zxf data.tar.gz -C ${D}
}
