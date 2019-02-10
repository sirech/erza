require 'spec_helper'

containers = %i[nginx db shelf2 echo]

describe service('docker') do
  it { is_expected.to be_running }
end

containers.each do |name|
  describe docker_container(name) do
    it { is_expected.to exist }
    it { is_expected.to be_running }
  end
end
