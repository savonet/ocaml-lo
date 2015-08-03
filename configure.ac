# check for one particular file of the sources
AC_INIT([ocaml-lo],[0.1.1],[savonet-users@lists.sourceforge.net])

VERSION=$PACKAGE_VERSION
AC_MSG_RESULT([configuring $PACKAGE_STRING])

AC_BASE_CHECKS()

# check for liblo
LIBS="$LIBS -llo"
#lo_address_new_with_proto was introduced in 0.26
AC_CHECK_HEADERS([lo/lo.h], [AC_CHECK_FUNC([lo_address_new_with_proto], [ac_have_lo="yes"])])
if test "$ac_have_lo" != "yes"; then
   AC_MSG_ERROR([LO headers (version >= 0.26) not found.])
fi

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
