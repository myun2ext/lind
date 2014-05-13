require 'fiddle'
module Lind
  def self.new_buffer(size)
    Fiddle::Pointer.malloc(size)
  end
end
