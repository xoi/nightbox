# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/cvs/lportage/x11-plugins/asclock/asclock-2.1.10.ebuild,v 1.6 2006/05/08 13:34:15 jettero Exp $

inherit eutils

MY_PV=2.1.10beta
MY_P=asclock-gtk-${MY_PV}.tar.gz
S="${WORKDIR}/asclock-gtk"

IUSE=""
DESCRIPTION="Clock applet for AfterStep with a moist aweseme analog gizmo!"
SRC_URI="http://web.cs.mun.ca/~gstarkes/wmaker/dockapps/files/${MY_P}"
HOMEPAGE="http://web.cs.mun.ca/~gstarkes/wmaker/dockapps/time.html"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"
DEPEND="virtual/libc"

src_unpack() {
	unpack ${A}
	cd ${S}

	epatch "${FILESDIR}"/${PN}-gtk-gcc41.patch
	epatch "${FILESDIR}"/${PN}-gtk-gtk2.patch
	epatch ${FILESDIR}/upos.patch
}

src_compile() {
	./configure < ${FILESDIR}/script
}

src_install () {
	dobin asclock
	dodir usr/share/asclock
	cp -a themes/* ${D}/usr/share/asclock
	dodoc CHANGES FAQ README README.THEMES
}
