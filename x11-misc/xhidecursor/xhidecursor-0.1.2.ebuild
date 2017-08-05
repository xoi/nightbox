EAPI=4
inherit xorg-2

DESCRIPTION="Hide idle X cursor"
HOMEPAGE="https://github.com/xoi/xhidecursor"
SRC_URI="https://github.com/xoi/${PN}/releases/download/${PV}/${P}.tar.gz"
KEYWORDS="amd64 ~x86"
RESTRICT="mirror"
RDEPEND="x11-libs/libXfixes
	x11-libs/libXi"
