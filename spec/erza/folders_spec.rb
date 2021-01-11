require 'spec_helper'

%i[shelf2_public cookery2_public].each do |folder|
  describe file("/srv/#{folder}") do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by(ci_user) }
  end
end
