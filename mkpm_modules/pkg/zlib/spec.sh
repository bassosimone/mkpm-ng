pkg_name=zlib
pkg_repo=https://github.com/madler/zlib

pkg_configure() {
    cd $mkpm_root/src/$pkg_name
    # Note: do not pass $mkpm_configure_flags here because zlib's configure does
    # not understand all the typical options supported by GNU autotools
    ./configure --prefix=$mkpm_root/dist
}
