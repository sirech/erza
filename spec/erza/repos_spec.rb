require 'spec_helper'

describe package('git') do
  it { should be_installed }
end

repo = '/srv/erza'.freeze

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
