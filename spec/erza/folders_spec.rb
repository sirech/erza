require 'spec_helper'

describe file('/srv/main') do
  it { is_expected.to be_directory }
  it { is_expected.to be_owned_by('travis') }
end
