mk_pkg_name=libressl
mk_pkg_repo=https://github.com/libressl-portable/portable

mk_pkg_clone() {
    cd $mkpm_root/src
    rm -rf $mk_pkg_name
    git clone --depth=4 $mk_pkg_repo $mk_pkg_name
    cd $mk_pkg_name
    # We clone openbsd sources instead of letting ./autogen.sh do that for
    # us because here we provide the --depth=4 flag to save time
    git clone --depth=4 https://github.com/libressl-portable/openbsd.git
    if [ "$mkpm_cross" = "ios" ]; then
    	# Applications cannot be compiled when cross compiling for arm64, but
    	# this is not an issue for us, since we don't use them
        mkpm_apply_patch pkg/$mk_pkg_name/000.diff
    fi
}
