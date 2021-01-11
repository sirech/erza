require 'spec_helper'

describe file('/root/.ssh') do
  it { is_expected.to be_directory }
  it { is_expected.to be_mode 700 }
  it { is_expected.to be_owned_by('root') }
end

describe file('/root/.ssh/authorized_keys') do
  it { is_expected.to be_file }
  it { is_expected.to be_mode 600 }
  it { is_expected.to be_owned_by('root') }
  its(:content) { is_expected.not_to be_empty }
end
