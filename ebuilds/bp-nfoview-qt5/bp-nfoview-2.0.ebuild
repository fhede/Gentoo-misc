# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils fdo-mime    
[[ ${PV} = *2.0* ]] && inherit git-r3  


DESCRIPTION="A Simple NFO-Viewer by brainpower"
HOMEPAGE="https://github.com/brainpower/bp-nfoview"
EGIT_REPO_URI="https://github.com/brainpower/bp-nfoview.git"

LICENSE="GPL-2 GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"

RDEPEND="
    dev-qt/qtcore:5"
    
DEPEND="${RDEPEND}
    dev-vcs/git
    dev-util/cmake"
	
src_configure() {
	local mycmakeargs=(
		-DUSE_QT5=ON
		-DCMAKE_INSTALL_PREFIX=/usr
)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	    
}

pkg_postinst() {
    fdo-mime_desktop_database_update
    
}

pkg_postrm() {
    fdo-mime_desktop_database_update
    
}

