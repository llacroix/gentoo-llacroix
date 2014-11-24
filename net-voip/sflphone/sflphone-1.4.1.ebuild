# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="SFLphone is a robust, standards-compliant enterprise softphone, for desktop and embedded systems. It is designed to handle several hundred calls a day. SFLphone is available under the GNU GPL license, version 3."
HOMEPAGE="http://sflphone.org"
SRC_URI="https://projects.savoirfairelinux.com/attachments/download/14805/sflphone-1.4.1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	cd daemon
	econf

	cd ..
	cd gnome
	econf
}

src_compile() {
	cd daemon
	cd libs
	sh compile_pjsip.sh || die "Compiling pjsip failed"
	cd ..
	emake

	cd ..
	cd gnome
	emake
}

src_install() {
	cd daemon
	emake DESTDIR="${D}" install

	cd ..
	cd gnome
	emake DESTDIR="${D}" install
}
