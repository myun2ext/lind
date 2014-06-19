#include "rubyext.h"

VALUE lind_load(VALUE self)
{
	hello();
	return Qnil;
}

void Init_lind()
{
	VALUE _lind;

	_lind = rb_define_module("Lind");
	rb_define_module_function(_lind, "load", lind_load, 0);
}
