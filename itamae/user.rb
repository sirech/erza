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

add_user_to_group node[:ci_user] do
  group 'docker'
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
