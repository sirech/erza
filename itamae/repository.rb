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
