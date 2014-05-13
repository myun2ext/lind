require 'fiddle'
require 'lind/symbol_to_fiddle_type'
module Lind
  module OfFiddle
    include SymbolToFiddleType

    def library(name)
      @lib = Fiddle::Handle.new(name.to_s)
    end

    def declare(name, arg_types = [], ret_type = :none)
      p arg_types.map { |v| symbol_to_fiddle_type(v) }
      p symbol_to_fiddle_type(ret_type)

      Fiddle::Function.new(
        func_addr(name.to_s),
        arg_types.map { |v| symbol_to_fiddle_type(v) },
        symbol_to_fiddle_type(ret_type)
      )
    end

    private
    def func_addr(name)
      @lib.sym(name)
    end
  end
end
