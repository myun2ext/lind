#include <windows.h>
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
	RB_MODULE mod_lind;
	RB_MODULE mod_core;
	RB_MODULE mod_library;

	mod_lind = 	  _RB_MODULE("Lind");
	mod_core =    _RB_MODULE_IN("Core", mod_lind);
	mod_library = _RB_MODULE_IN("Library", mod_core);

	rb_define_alloc_func(mod_library, lind_library_alloc);
	rb_define_private_method(mod_library, "initialize", lind_llibrary_initialize, 1);
}
