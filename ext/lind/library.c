#include "rubyext.h"

struct lind_library_inner_t
{
	HMODULE h;
};

void lind_library_free(struct lind_library_inner_t* p)
{
	FreeLibrary(p->h);
	free(p);
}

VALUE lind_library_alloc(VALUE self)
{
	return Data_Wrap_Struct(self, NULL, lind_library_free, ALLOC(struct lind_library_inner_t));
}

VALUE lind_llibrary_initialize(VALUE self, VALUE name)
{
	struct lind_library_inner_t* p;

	Data_Get_Struct(self, struct lind_library_inner_t, p);

	p->h = LoadLibrary(StringValuePtr(name));
	if ( p->h == NULL )
	{
		rb_raise(rb_eStandardError, "LoadLibrary error");
	}
	return Qnil;
}

void Init_lind_library()
{
	VALUE _lind;
	VALUE _lind_core;
	VALUE _lind_library;

	_lind = 	    rb_define_module("Lind");
	_lind_core = 	rb_define_module_under(_lind, "Core");
	_lind_library = rb_define_module_under(_lind_core, "Library");

	rb_define_alloc_func(_lind_library, lind_library_alloc);
	rb_define_private_method(_lind_library, "initialize", lind_llibrary_initialize, 1);
}
