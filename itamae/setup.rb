# User

user node[:ci_user] do
  password ''
  system_user true
  shell '/bin/bash'
end

directory "/home/#{node[:ci_user]}/.ssh" do
  action :create
  owner 'travis'
  group 'travis'
  mode '700'
end

execute 'add to docker group' do
  command "usermod -aG docker #{node[:ci_user]}"
end

if File.exist?('./files/authorized_keys')
  puts 'installing authorized keys'
  remote_file "/home/#{node[:ci_user]}/.ssh/authorized_keys" do
    action :create
    source '../files/authorized_keys'
    owner node[:ci_user]
    group node[:ci_user]
    mode '600'
  end
else
  puts 'authorized keys not present'
end

# Certificates

if File.exist?('./files/cert')
  puts 'installing certificates'
  remote_directory '/cert' do
    action :create
    source '../files/cert'
  end
else
  puts 'certificates not present'
end

execute 'auto-renewal for certificates' do
  command "(crontab -l 2>/dev/null; echo \"0 6 * * 1 sh #{node[:directory]}/bin/renew 2>&1 | /usr/bin/logger -t letsencrypt\") | crontab -"
  not_if 'crontab -l | grep -q bin/renew'
end

# Packages

%w[git python-pip docker-compose].each do |pkg|
  package pkg do
    action :install
  end
end

# Repository

git '' do
  action :sync
  destination node[:directory]
  repository node[:repository]
end

remote_file "#{node[:directory]}/.env" do
  action :create
  source '~/Dropbox/erza/.env'
  mode '644'
end

# Folders

%i[main shelf2_public cookery2_public].each do |folder|
  directory "/srv/#{folder}" do
    action :create
    owner node[:ci_user]
  end
end
