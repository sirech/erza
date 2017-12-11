require 'spec_helper'

%w[cert].each do |file|
  describe file("/#{file}") do
    it { should be_directory }
    it { should be_readable }
    it { should be_directory }
  end
end
