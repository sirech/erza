# User

user 'travis' do
  password ''
  system_user true
end

directory '/home/travis/.ssh' do
  action :create
  mode '700'
end

if File.exist?('./files/authorized_keys')
  puts 'installing authorized keys'
  remote_file '/home/travis/.ssh/authorized_keys' do
    action :create
    source '../files/authorized_keys'
    owner 'travis'
    group 'travis'
    mode '600'
  end
else
  puts 'authorized keys not present'
end

# Certificates

if File.exist?('./files/cert')
  puts 'installing certificates'
  remote_directory '/cert2' do
    action :create
    source '../files/cert'
  end
else
  puts 'certificates not present'
end

execute 'auto-renewal for certificates' do
  command '(crontab -l 2>/dev/null; echo "0 6 * * 1 sh /srv/erza/bin/renew 2>&1 | /usr/bin/logger -t letsencrypt") | crontab -'
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
  destination '/srv/erza'
  repository 'https://github.com/sirech/erza.git'
end

remote_file '/srv/erza/.env' do
  action :create
  source '~/Dropbox/erza/.env'
end

# Folders

%i[main shelf2_public cookery2_public].each do |folder|
  directory "/srv/#{folder}" do
    action :create
    user 'travis'
  end
end
