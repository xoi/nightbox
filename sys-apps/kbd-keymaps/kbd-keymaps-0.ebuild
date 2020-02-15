EAPI=7

DESCRIPTION="Additional keymaps for kbd"
KEYWORDS="amd64 ~x86"
SLOT="0"

S=${WORKDIR}

src_install() {
	insinto /usr/share/keymaps
	doins -r "${FILESDIR}/${PVR}"/*
}
