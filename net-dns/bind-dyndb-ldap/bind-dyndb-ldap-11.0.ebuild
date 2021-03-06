# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools toolchain-funcs

DESCRIPTION="Bind DynDB LDAP backend (replacement for sdb-ldap and dlz)"
HOMEPAGE="https://fedorahosted.org/bind-dyndb-ldap/"
SRC_URI="https://github.com/freeipa/bind-dyndb-ldap/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-dns/bind-9.11"
RDEPEND="${DEPEND}"

src_prepare() {
	# Disable Werror due to -Wmissing-field-initializers error
	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60784#c8
	eapply "${FILESDIR}/gcc-4.9.3-werror.patch"

	eautoreconf

	eapply_user
}

