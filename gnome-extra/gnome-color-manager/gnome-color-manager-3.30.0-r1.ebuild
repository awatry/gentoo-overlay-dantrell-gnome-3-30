# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit gnome2 meson

DESCRIPTION="Color profile manager for the GNOME desktop"
HOMEPAGE="https://gitlab.gnome.org/GNOME/gnome-color-manager"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"

IUSE="packagekit raw"

# Need gtk+-3.3.8 for https://bugzilla.gnome.org/show_bug.cgi?id=673331
RDEPEND="
	>=dev-libs/glib-2.31.10:2
	>=media-libs/lcms-2.2:2
	>=media-libs/libcanberra-0.10[gtk3]
	media-libs/libexif
	media-libs/tiff:0=

	>=x11-libs/gtk+-3.3.8:3
	>=x11-libs/vte-0.25.1:2.91
	>=x11-misc/colord-1.3.1:0=
	>=x11-libs/colord-gtk-0.1.20

	packagekit? ( app-admin/packagekit-base )
	raw? ( media-gfx/exiv2:0= )
"
# docbook-sgml-{utils,dtd:4.1} needed to generate man pages
DEPEND="${RDEPEND}
	app-text/docbook-sgml-dtd:4.1
	app-text/docbook-sgml-utils
	dev-libs/appstream-glib
	dev-util/itstool
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/${PN}-3.26.0-fix-libm-check.patch

	# https://bugzilla.gnome.org/show_bug.cgi?id=796428
	"${FILESDIR}"/${PN}-3.28-remove-unwvanted-check.patch
)

src_prepare() {
	gnome2_src_prepare

	# Fix hard-coded package name
	# https://gitlab.gnome.org/GNOME/gnome-color-manager/issues/3
	sed 's:argyllcms:media-gfx/argyllcms:' -i src/gcm-utils.h || die
}

src_configure() {
	local emesonargs=(
		-D tests=false
		-D exiv=$(usex raw true false)
		-D packagekit=$(usex packagekit true false)
	)
	meson_src_configure
}
