# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit gnome2 meson

DESCRIPTION="Unicode character map viewer and library"
HOMEPAGE="https://wiki.gnome.org/Design/Apps/CharacterMap"

LICENSE="GPL-2+ BSD"
SLOT="0"
KEYWORDS="*"

IUSE=""

RESTRICT="test"

RDEPEND="
	>=dev-libs/gjs-1.43.3
	>=dev-libs/glib-2.32:2
	>=dev-libs/gobject-introspection-1.35.9:=
	>=dev-libs/libunistring-0.9.5
	>=x11-libs/gtk+-3.20:3[introspection]
	x11-libs/gdk-pixbuf:2
	>=x11-libs/pango-1.36[introspection]
"
DEPEND="${RDEPEND}
	dev-libs/libxml2:2
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		-D pangoft2=true
		-D installed_tests=false
	)
	meson_src_configure
}
