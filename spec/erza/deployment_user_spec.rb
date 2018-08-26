require 'spec_helper'

describe group('docker') do
  it { is_expected.to exist }
end

user = 'travis'.freeze
home = "/home/#{user}".freeze

describe user(user) do
  it { is_expected.to exist }

  it { is_expected.to belong_to_group 'docker' }
end

describe file("#{home}/.ssh/authorized_keys") do
  it { is_expected.to be_file }
  it { is_expected.to be_mode 600 }
end
