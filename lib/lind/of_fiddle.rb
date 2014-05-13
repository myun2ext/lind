require 'fiddle'
module Lind
  module OfFiddle
    def library(name)
      @lib = Fiddle::Handle.new(name)
    end

    def declare(name, arg_types = [], ret_type = TYPE_VOID)
      Fiddle::Function.new(func_addr(name), arg_types, ret_type)
    end

    private
    def func_addr(name)
      @lib.sym(name)
    end
  end
end
