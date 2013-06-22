EAPI=5

CMAKE_BUILD_TYPE=Release

inherit cmake-utils git-2

DESCRIPTION="VDPAU driver with OpenGL/VAAPI backend"
HOMEPAGE="https://github.com/i-rinat/libvdpau-va-gl"
EGIT_REPO_URI="git://github.com/i-rinat/libvdpau-va-gl.git"
SLOT="0"
KEYWORDS=""
DEPEND="x11-libs/libvdpau
	x11-libs/libva
	dev-libs/glib
	media-video/ffmpeg
	media-libs/mesa
	media-libs/glu"
