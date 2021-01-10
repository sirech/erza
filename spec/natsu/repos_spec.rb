require 'spec_helper'

describe package('git') do
  it { is_expected.to be_installed }
end

repo = '/srv/erza'.freeze

describe file(repo) do
  it { is_expected.to be_directory }
  it { is_expected.to be_grouped_into 'root' }
end

describe file("#{repo}/bin") do
  it { is_expected.to be_directory }
  it { is_expected.to be_grouped_into 'root' }
end

describe file("#{repo}/.git") do
  it { is_expected.to be_directory }
end

describe file("#{repo}/natsu/.env") do
  it { is_expected.to be_file }
  it { is_expected.to be_readable.by('others') }

  %w[HOST ALTERNATIVE_HOST DB_PASSWORD SECRET_KEY_BASE].each do |key|
    its(:content) { is_expected.to match Regexp.new("#{key}=") }
  end
end

%i[update promote].each do |script|
  describe file("#{repo}/bin/#{script}") do
    it { is_expected.to be_file }
    it { is_expected.to be_executable.by('others') }
  end
end

describe file("#{repo}/docker-compose.yml") do
  it { is_expected.to be_file }
  it { is_expected.to be_readable.by('others') }
end
