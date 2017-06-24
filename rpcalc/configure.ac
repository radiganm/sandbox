#!autoconf -f
## configure.ac
## Mac Radigan

AC_INIT([rpcalc], [1.0], [rpcalc])
AC_MSG_NOTICE([rpcalc])

AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
AC_PROG_CC
AC_PROG_CXX
AC_PROG_F77
AM_PROG_AR
AC_PROG_RANLIB

AC_LANG(C++)

LT_INIT([disable-static])
AM_DISABLE_STATIC
AC_PROG_LIBTOOL

AC_CONFIG_HEADERS([config.h])
AC_CHECK_HEADERS(iostream)
AC_CHECK_LIB([rt], [main])
AC_CHECK_LIB(m, cos)
AC_CHECK_HEADER(unistd.h)
AC_CHECK_HEADERS([stdlib.h])

## pthreads
AC_CHECK_HEADER([pthread.h], [], [AC_MSG_ERROR([cannot find header pthread.h])])
AC_MSG_CHECKING([for -lpthread])
LIBS="-lpthread"

AC_PROG_AWK(mawk gawk nawk tawk fawk bawk hawk cawk pawk) 
AC_CHECK_PROG(PERL, perl, perl)

AC_PROG_CC
AC_PROG_YACC
AC_PROG_LEX

#YACC
#if test x"$YACC" != x"yes"; then
#  AC_MSG_ERROR([Please install bison before installing.])
#fi
#if test "x$LEX" != xflex; then
#  AC_MSG_ERROR([Please install flex before installing.])
#fi

#AC_CHECK_HEADER(b0rk.h)
#if test "$ac_cv_header_b0rk_h" == no
#then
##  AC_MSG_WARN([Error, the b0rk header is missing!])
#fi

#AC_DEFINE(my_own_define, yes)

cp confdefs.h src/config.h

AC_CONFIG_FILES([
  makefile
])
AC_OUTPUT

## *EOF*
