require 'spec_helper'

%w[cert].each do |file|
  describe file("/#{file}") do
    it { should be_directory }
    it { should be_readable }
    it { should be_directory }
  end
end

describe cron do
  it { should have_entry '0 6 1 * * sh /srv/erza/bin/renew 2>&1 | /usr/bin/logger -t letsencrypt' }
end
