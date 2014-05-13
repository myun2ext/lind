#require './lib/lind/of_fiddle'
require './lib/lind/of_fiddle_importer'

describe Lind do
  context "MessageBox API" do
    let(:declare_module) do
      module MessageBox
        extend Lind::OfFiddleImporter

        library "user32"
        declare "MessageBox", ["void*", "const char*", "const char*", "int"], "int"
      end
    end

    before do
      declare_module
    end

    it { MessageBox.MessageBox(nil, "aa", "bb", 0).should eq 1 }
  end
end
