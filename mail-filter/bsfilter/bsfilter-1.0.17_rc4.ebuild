# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-filter/bsfilter/bsfilter-1.0.15.ebuild,v 1.3 2008/03/14 10:02:26 phreak Exp $

MY_P=${P/_rc/.rc}

DESCRIPTION="bayesian spam filter which distinguishes spam and non-spam mail"
HOMEPAGE="http://bsfilter.org/index-e.html"
SRC_URI="http://jaist.dl.sourceforge.jp/${PN}/39712/${MY_P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="mecab chasen doc"

DEPEND="dev-lang/ruby"

RDEPEND="${DEPEND}
	mecab? ( dev-ruby/mecab-ruby )
	chasen? ( dev-ruby/ruby-chasen )"

S="${WORKDIR}/${MY_P}"

src_compile() {
	:
}

src_install() {
	dobin "${S}/${PN}/${PN}" || die
	if use doc; then
	   dohtml -r "${S}/htdocs/"* || die
	fi
}
