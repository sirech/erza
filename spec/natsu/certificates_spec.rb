require 'spec_helper'

%w[cert cert/live cert/renewal].each do |file|
  describe file("/#{file}") do
    it { is_expected.to be_directory }
    it { is_expected.to be_readable }
  end
end

describe command('find /cert/live -type l') do
  its(:stdout) { is_expected.not_to be_empty }
end

describe cron do
  it { is_expected.to have_entry '0 6 * * 1 sh /srv/erza/bin/renew 2>&1 | /usr/bin/logger -t letsencrypt' }
end
