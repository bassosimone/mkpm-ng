pkg_name=yaml-cpp
pkg_repo=https://github.com/jbeder/yaml-cpp
pkg_deps=boost

pkg_configure() {
    cd $mkpm_root/src/$pkg_name
    cmake -D Boost_INCLUDE_DIR="$mkpm_root/dist/include" \
          -D CMAKE_INSTALL_PREFIX="$mkpm_root/dist" .
}

