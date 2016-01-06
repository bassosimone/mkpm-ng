mk_pkg_name=http-parser
mk_pkg_repo=https://github.com/nodejs/http-parser

mk_pkg_make() {
    cd $mkpm_root/src/$mk_pkg_name
    cc $CPPFLAGS $CFLAGS -I. -c -o http_parser.o http_parser.c
    ar cr libhttp_parser.a http_parser.o
}

mk_pkg_install() {
    cd $mkpm_root/src/$mk_pkg_name
    install -d $mkpm_root/dist/include
    install http_parser.h $mkpm_root/dist/include
    install -d $mkpm_root/dist/lib
    install libhttp_parser.a $mkpm_root/dist/lib
}
