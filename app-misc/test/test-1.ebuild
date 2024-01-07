# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Tests for the llvm create_directories failure"
HOMEPAGE="https://example.org/"
S="${WORKDIR}"

LICENSE="GPL-3+"

SLOT="0"

KEYWORDS="~amd64"

inherit meson llvm

DEPEND="sys-devel/llvm"
BDEPEND="dev-util/meson"

src_unpack() {
		cp "${FILESDIR}/main.cpp" "${FILESDIR}/meson.build" ./
}

src_test() {
		einfo "Trying:" "${BUILD_DIR}/main" "${T}/inexistent/../directory"
		"${BUILD_DIR}/main" "${T}/inexistent/../directory" \
				|| die "This works outside of the sandbox"
}

src_install() {
	:
}
