#require './lib/lind/of_fiddle'
require './lib/lind/of_fiddle_importer'

describe Lind do
  before do
    `gcc -shared -o spec/mock.dll spec/mock_src/mock.c`
  end

  let(:declare_module) do
    module MockLib
      extend Lind::OfFiddleImporter

      library "./spec/mock"
      declare "x_plus_y", ["int", "int"], "int"
    end
  end

  before do
    declare_module
  end

  it { MockLib.x_plus_y(4, 7).should eq 11 }
end
