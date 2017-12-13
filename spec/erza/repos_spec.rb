require 'spec_helper'

describe package('git') do
  it { should be_installed }
end

repo = '/srv/erza'.freeze

describe file(repo) do
  it { should be_directory }
  it { should be_grouped_into 'root' }
end

describe file("#{repo}/bin") do
  it { should be_directory }
  it { should be_grouped_into 'root' }
end

describe file("#{repo}/.git") do
  it { should be_directory }
end

describe file("#{repo}/.env") do
  it { should be_file }
  it { should be_readable.by('others') }

  %w[HOST DB_PASSWORD SECRET_KEY_BASE].each do |key|
    its(:content) { should match Regexp.new("#{key}=") }
  end
end

describe file("#{repo}/bin/update") do
  it { should be_file }
  it { should be_executable.by('others') }
end

describe file("#{repo}/docker-compose.yml") do
  it { should be_file }
  it { should be_readable.by('others') }
end
