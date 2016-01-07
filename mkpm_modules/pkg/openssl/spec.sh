pkg_name=openssl
pkg_repo=https://github.com/openssl/$pkg_name
pkg_branch=OpenSSL_1_0_2-stable

pkg_configure() {
    cd $mkpm_root/src/$pkg_name
    ./config --prefix=$mkpm_root/dist/ $mkpm_configure_flags
}

pkg_make() {
    cd $mkpm_root/src/$pkg_name
    make depend
    make
}

pkg_make_install() {
    cd $mkpm_root/src/$pkg_name
    install -d $mkpm_root/dist/include/openssl
    install -d $mkpm_root/dist/lib
    install libcrypto.a libssl.a $mkpm_root/dist/lib
    find include/openssl -name \*.h -exec install {} \
        $mkpm_root/dist/include/openssl \;
}
