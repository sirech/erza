require 'spec_helper'

describe package('git') do
  it { should be_installed }
end

repo = '/srv/erza'.freeze
repos = %w[homepage shelf2-backend shelf2-frontend].freeze

describe file(repo) do
  it { should be_directory }
  it { should be_grouped_into 'docker' }
end

describe file("#{repo}/bin") do
  it { should be_directory }
  it { should be_grouped_into 'docker' }
end

describe file("#{repo}/.git") do
  it { should be_directory }
end

describe file("#{repo}/.env") do
  it { should be_file }

  it { should be_mode 660 }

  %w[HOST DB_PASSWORD SECRET_KEY_BASE].each do |key|
    its(:content) { should match Regexp.new("#{key}=") }
  end
end

repos.each do |sub_repo|
  describe file("#{repo}/#{sub_repo}/.git") do
    it { should be_file }
  end
end
