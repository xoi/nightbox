EAPI=7

DESCRIPTION="Incremental search method for Japanese text"
HOMEPAGE="http://0xcc.net/migemo/"
SRC_URI="${HOMEPAGE}${P}.tar.gz"
KEYWORDS="amd64 ~x86"
SLOT="0"
DEPEND="
	dev-ruby/bsearch
	dev-ruby/ruby-romkan
	app-dicts/migemo-dict[-unicode]
"
BDEPEND="dev-lang/ruby"
RDEPEND="${BDEPEND} ${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-bsearch.patch"
	"${FILESDIR}/${P}-no-install-dict.patch"
	"${FILESDIR}/${P}-ruby19.patch"
	"${FILESDIR}/${P}-without-emacs.patch"
)

src_prepare() {
	cp /usr/share/migemo/migemo-dict . || die
	default
}

src_configure() {
	econf --without-emacs
}
