require 'spec_helper'

describe group('docker') do
  it { should exist }
end

user = 'travis'.freeze
home = "/home/#{user}".freeze

describe user(user) do
  it { should exist }

  it { should belong_to_group 'docker' }
end

describe file("#{home}/.ssh/authorized_keys") do
  it { should be_file }
  it { should be_mode 600 }
end
