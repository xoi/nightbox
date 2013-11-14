# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="bayesian spam filter which distinguishes spam and non-spam mail"
HOMEPAGE="http://sourceforge.jp/projects/bsfilter/"
SRC_URI="http://iij.dl.sourceforge.jp/${PN}/59804/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"
IUSE="mecab chasen doc"
RESTRICT="mirror"

DEPEND="dev-lang/ruby"

RDEPEND="${DEPEND}
	mecab? ( dev-ruby/mecab-ruby )
	chasen? ( dev-ruby/ruby-chasen )"

src_compile() {
	:
}

src_install() {
	dobin "${S}/${PN}/${PN}" || die
	if use doc; then
	   dohtml -r "${S}/htdocs/"* || die
	fi
}
