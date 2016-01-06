mk_pkg_name=tor
mk_pkg_repo=https://git.torproject.org/tor.git

mk_pkg_clone() {
    cd $mkpm_root/src
    rm -rf $mk_pkg_name
    git clone --depth=4 $mk_pkg_repo
    cd $mk_pkg_name
    mkpm_apply_patch pkg/$mk_pkg_name/000.diff
    if [ "$mkpm_cross" = "ios" ]; then
        mkpm_apply_patch pkg/$mk_pkg_name/001.diff
    fi
}

mk_pkg_configure() {
    cd $mkpm_root/src/$mk_pkg_name
    ./autogen.sh
    ./configure --disable-asciidoc --disable-system-torrc                      \
                --disable-unittests --disable-tool-name-check                  \
                --with-openssl-dir=$mkpm_root/dist                             \
                --with-zlib-dir=$mkpm_root/dist                                \
                --with-libevent-dir=$mkpm_root/dist $mkpm_configure_flags
}

mk_pkg_install() {
    cd $mkpm_root/src/$mk_pkg_name
    install -d $mkpm_root/dist/bin
    install src/or/tor $mkpm_root/dist/bin
    install -d $mkpm_root/dist/lib
    find src -type f -name \*.a -exec install -v {} $mkpm_root/dist/lib \;
    install -d $mkpm_root/dist/include/tor
    install micro-revision.i $mkpm_root/dist/include/tor
    mkpm_install_resource pkg/$mk_pkg_name/libtor.h $mkpm_root/dist/include
}
