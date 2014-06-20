#ifndef __MYUN2__RUBYEXT_H__
#define __MYUN2__RUBYEXT_H__

#include <ruby.h>

#define RB_MODULE	VALUE
#define RB_VALUE	VALUE

#define _RB_MODULE(X)		rb_define_module(X)
#define _RB_MODULE_IN(X,Y)	rb_define_module_under(Y,X)

#endif//__MYUN2__RUBYEXT_H__
