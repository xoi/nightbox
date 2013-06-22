# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-dicts/migemo-dict/migemo-dict-200812.ebuild,v 1.9 2010/09/27 09:20:53 xmw Exp $

inherit eutils

IUSE="unicode"

DESCRIPTION="Dictionary files for the Migemo and C/Migemo"
HOMEPAGE="http://openlab.ring.gr.jp/skk/dic.html"
MIGEMO_PV=0.40
S="${WORKDIR}/migemo-${MIGEMO_PV}"
SRC_URI="mirror://gentoo/skk-jisyo-${PV}.tar.bz2
	http://0xcc.net/migemo/stable/migemo-${MIGEMO_PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="alpha amd64 ~arm hppa ia64 ppc ppc64 sparc x86 ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos"
SLOT="0"

src_unpack() {
	unpack migemo-${MIGEMO_PV}.tar.gz
	rm "${S}"/migemo-dict
	unpack skk-jisyo-${PV}.tar.bz2
	cp skk-jisyo-${PV}/SKK-JISYO.L "${S}"
	cd "${S}"

	epatch "${FILESDIR}/migemo-${MIGEMO_PV}-without-emacs.patch"
}

src_compile() {
	econf --without-emacs || die
	# emake b0rks
	emake -j1 migemo-dict || die

	cd "${S}"
	if use unicode ; then
		iconv -f euc-jp -t utf-8 migemo-dict > "${T}/migemo-dict"
	else
		cp migemo-dict "${T}/migemo-dict"
	fi
}

src_install() {
	insinto /usr/share/migemo
	doins "${T}/migemo-dict"
}
