# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit gnome2 meson

DESCRIPTION="Manage your online calendars with simple and modern interface"
HOMEPAGE="https://wiki.gnome.org/Apps/Calendar"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="*"

IUSE=""

# >=libical-1.0.1 for https://bugzilla.gnome.org/show_bug.cgi?id=751244
RDEPEND="
	>=dev-libs/glib-2.43.4:2
	>=x11-libs/gtk+-3.21.6:3
	>=gnome-extra/evolution-data-server-3.17.1:=
	>=dev-libs/libical-1.0.1:0=
	net-libs/libsoup:2.4
	>=dev-libs/libdazzle-3.26.1
	>=net-libs/gnome-online-accounts-3.2.0:=
	>=gnome-base/gsettings-desktop-schemas-3.21.2
"
DEPEND="${RDEPEND}
	dev-libs/appstream-glib
	dev-libs/libxml2:2
	dev-util/gdbus-codegen
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
"
