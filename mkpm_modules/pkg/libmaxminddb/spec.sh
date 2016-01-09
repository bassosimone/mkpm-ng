pkg_name=libmaxminddb
pkg_repo=https://github.com/maxmind/libmaxminddb

pkg_clone() {
    cd $mkpm_root/src
    rm -rf $pkg_name
    git clone --recursive --depth=4 --branch=$pkg_branch $pkg_repo
}
