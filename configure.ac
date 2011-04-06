# check for one particular file of the sources
AC_INIT(ocaml-lo, 0.1.0, savonet-users@lists.sourceforge.net)

VERSION=$PACKAGE_VERSION
AC_MSG_RESULT([configuring $PACKAGE_STRING])

# Add prefix to compilation variables
# if passed
if test "x$prefix" != "xNONE"; then
        CFLAGS="$CFLAGS -I$prefix/include"
        LDFLAGS="$LDFLAGS -L$prefix/lib"
        CPPFLAGS="$CPPFLAGS -I$prefix/include"
fi

AC_CHECK_OCAML_COMPILERS()

AC_PROG_CC()
AC_CHECK_TOOL([AR],[ar],no)
AC_SUBST(AR)

# check for liblo
AC_CHECK_HEADERS([lo/lo.h], [AC_CHECK_FUNC([lo_address_new], [ac_have_lo="yes"])])
LIBS="$LIBS -llo"

# substitutions to perform
AC_SUBST(VERSION)
AC_SUBST(INC)
ALL_INC="`ocamlfind query -r -separator " " $requires` $INC"
AC_SUBST(ALL_INC)
AC_SUBST(requires)
all_requires="`ocamlfind query -r -separator " " -format "%p" $requires`"
AC_SUBST(all_requires)

# Finally create the Makefile and samples
AC_CONFIG_FILES([Makefile],[chmod a-w Makefile])
AC_CONFIG_FILES([src/META])
AC_CONFIG_FILES([src/Makefile])
AC_OUTPUT
