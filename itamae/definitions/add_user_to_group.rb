define :add_user_to_group, group: nil do
  user = params[:name]
  group = params[:group]

  execute "usermod -a -G #{group} #{user}" do
    not_if "id #{user} | sed 's/ context=.*//g' | cut -f 4 -d '=' | grep -q #{group}"
  end
end
