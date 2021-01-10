require 'spec_helper'

containers = %i[nginx]

%i[docker-ce docker-compose].each do |pkg|
  describe package(pkg) do
    it { is_expected.to be_installed }
  end
end

describe service('docker') do
  it { is_expected.to be_running }
end

containers.each do |name|
  describe docker_container(name) do
    it { is_expected.to exist }
    it { is_expected.to be_running }
  end
end
