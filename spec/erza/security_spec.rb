require 'spec_helper'

[22, 80, 443].each do |port|
  describe port(port) do
    it { is_expected.to be_listening }
  end
end

[3000, 3306, 4000].each do |port|
  describe port(port) do
    it { is_expected.not_to be_listening }
  end
end
