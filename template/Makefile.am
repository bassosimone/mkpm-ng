# Part of measurement-kit <https://measurement-kit.github.io/>.
# Measurement-kit is free software. See AUTHORS and LICENSE for more
# information on the copying conditions.

AUTOMAKE_OPTIONS = foreign 1.9 subdir-objects
ACLOCAL_AMFLAGS = -I m4

noinst_PROGRAMS =  # Empty
check_PROGRAMS =  # Empty
TESTS =  # Empty

VALGRIND = valgrind --trace-children=yes --error-exitcode=1 \
                    --dsymutil=yes --leak-check=yes

run-valgrind: $(check_PROGRAMS)
	for test_name in $(TESTS); do                                          \
	  $(VALGRIND) $$test_name || exit 1;                                   \
	done

include include.am
