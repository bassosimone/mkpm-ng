pkg_name=boost
_pkg_sources="assert config core detail iterator mpl predef preprocessor smart_ptr static_assert throw_exception type_traits typeof utility"

pkg_clone() {	
    cd $mkpm_root/src
    rm -rf $pkg_name
    mkdir $pkg_name
    cd $pkg_name
    for MODULE in $_pkg_sources; do
		git clone --depth=4 --branch=$pkg_branch https://github.com/boostorg/$MODULE
	done
}

pkg_install() {	
    cd $mkpm_root/src/$pkg_name
 	for MODULE in `ls`; do
 	    if [ -d $MODULE/include ]; then
			for HEADER in `find $MODULE/include -type f`; do
 	            REL_HEADER=`echo $HEADER | sed "s|$MODULE/include/||g"`
 	            HEADER_DIR=`dirname $REL_HEADER`
 	            install -vd $mkpm_root/dist/include/$HEADER_DIR
 	            install -vm 644 $HEADER $mkpm_root/dist/include/$HEADER_DIR
 	        done
 	    fi
 	done
}
