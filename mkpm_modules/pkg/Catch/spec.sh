mk_pkg_name=Catch
mk_pkg_repo=https://github.com/philsquared/Catch

mk_pkg_install() {
    cd $mkpm_root/src/$mk_pkg_name
    install -d $mkpm_root/dist/include/
    install single_include/catch.hpp $mkpm_root/dist/include/
}
