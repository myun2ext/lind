require 'fiddle'
module Lind
  module SymbolToFiddleType
    def symbol_to_fiddle_type(sym)
      return sym unless sym.kind_of? Symbol

      case sym
      when nil
      when :non
      when :none
      when :v
      when :void   then Fiddle::TYPE_VOID
      when :c
      when :char   then Fiddle::TYPE_CHAR
      when :i
      when :int    then Fiddle::TYPE_INT
      when :l
      when :long   then Fiddle::TYPE_LONG
      when :short  then Fiddle::TYPE_SHORT
      when :s
      when :string then Fiddle::TYPE_VOIDP
      end
    end
  end
end
