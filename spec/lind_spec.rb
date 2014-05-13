require './lib/lind/of_fiddle'

describe Lind do
  before(:all) do
    if RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/
      libext = "dll"
    else
      libext = "so"
    end
    `gcc -shared -o spec/mock.#{libext} spec/mock_src/mock.c -fno-builtin-strcpy`

    $?.exitstatus.should eq 0
  end

  let(:declare_module) do
    module MockLib
      extend Lind::OfFiddle

      library "./spec/mock"
      declare :x_plus_y,          [:int, :int], :int
      declare :get_string,        [], :s
      declare :get_string_buffer, [:s]
      declare :check_string,      [:s], :int
    end
  end
  before do
    declare_module
  end

  it { MockLib.x_plus_y(4, 7).should eq 11 }
  it { MockLib.get_string().to_s.should eq "String" }
  it {
    buf = Lind.new_buffer(7)
    MockLib.get_string_buffer(buf)
    buf.to_s.should eq "String"
  }
  it { MockLib.check_string("String").should eq 0 }
end
