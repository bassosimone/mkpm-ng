pkg_name=Catch
pkg_repo=https://github.com/philsquared/Catch

pkg_install() {
    cd $mkpm_root/src/$pkg_name
    install -d $mkpm_root/dist/include/
    install single_include/catch.hpp $mkpm_root/dist/include/
}
