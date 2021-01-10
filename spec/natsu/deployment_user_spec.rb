require 'spec_helper'

describe group('docker') do
  it { is_expected.to exist }
end

describe user(ci_user) do
  it { is_expected.to exist }

  it { is_expected.to belong_to_group 'docker' }
end

describe file("#{ci_home}/.ssh") do
  it { is_expected.to be_directory }
  it { is_expected.to be_mode 700 }
  it { is_expected.to be_owned_by(ci_user.to_sym) }
end

describe file("#{ci_home}/.ssh/authorized_keys") do
  it { is_expected.to be_file }
  it { is_expected.to be_mode 600 }
  it { is_expected.to be_owned_by(ci_user.to_sym) }
  its(:content) { is_expected.to match(/build@travis-ci.org/) }
end
