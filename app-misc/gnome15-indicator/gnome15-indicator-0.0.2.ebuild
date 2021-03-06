EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit autotools bzr # python

DESCRIPTION="Gnome15 desktop service using the Indicator specification from the Ayatana project."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Desktop/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="=app-misc/gnome15-core-${PV}"
DEPEND="${RDEPEND}"


MY_SUBPACKAGE="gnome15-indicator"

src_prepare() {
	cd ${MY_SUBPACKAGE} && eautoreconf || die "eautoreconf failed"
}

src_configure() {
	cd ${MY_SUBPACKAGE} && econf || die "econf failed"
}

src_install() {
	cd ${MY_SUBPACKAGE} && emake DESTDIR="${D}" install || die "emake install failed"
}

# pkg_postinst() {
# 	python_mod_optimize ${PN}
# }

# pkg_postrm() {
# 	python_mod_cleanup ${PN}
# }


