require 'fiddle'
require 'fiddle/import'

module Lind
  module OfFiddleImporter
    include Fiddle::Importer

    def library(name)
      dlload name
    end

    def declare(name, args, ret)
      args_to_s = args.join(',')
      extern "#{ret} #{name}(#{args_to_s})"
    end
  end
end
