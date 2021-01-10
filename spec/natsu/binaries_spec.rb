require 'spec_helper'

describe package('curl') do
  it { is_expected.to be_installed }
end

describe file('/usr/local/bin/lock') do
  it { is_expected.to be_file }
  it { is_expected.to be_executable }
end

describe file('/tmp/lock') do
  it { is_expected.to be_file }
  it { is_expected.to be_owned_by(:ci) }
end
