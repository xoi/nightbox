EAPI=4
inherit xorg-2

DESCRIPTION="X11 Screen Saver hook"
HOMEPAGE="https://github.com/xoi/xsshook"
SRC_URI="https://github.com/xoi/${PN}/releases/download/${PV}/${P}.tar.gz"
KEYWORDS="amd64 ~x86"
RESTRICT="mirror"
RDEPEND="x11-libs/libXScrnSaver"
