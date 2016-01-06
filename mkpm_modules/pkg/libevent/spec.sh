mk_pkg_name=libevent
mk_pkg_repo=https://github.com/libevent/libevent
mk_pkg_branch=patches-2.0

# Such that the libressl compiled by us is found by ./configure
export CPPFLAGS="$CPPFLAGS -I$mkpm_root/dist/include"
export LDFLAGS="$LDFLAGS -L$mkpm_root/dist/lib"
