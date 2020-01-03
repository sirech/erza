%i[main shelf2_public cookery2_public].each do |folder|
  directory "/srv/#{folder}" do
    action :create
    owner node[:ci_user]
  end
end
