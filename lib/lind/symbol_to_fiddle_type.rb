require 'fiddle'
module Lind
  module SymbolToFiddleType
    def symbol_to_fiddle_type(sym)
      return sym unless sym.kind_of? Symbol

      case sym
      when nil, :non, :none, :v, :void then Fiddle::TYPE_VOID
      when :c, :char   then Fiddle::TYPE_CHAR
      when :i, :int    then Fiddle::TYPE_INT
      when :l, :long   then Fiddle::TYPE_LONG
      when :short      then Fiddle::TYPE_SHORT
      when :s, :string then Fiddle::TYPE_VOIDP
      end
    end
  end
end
