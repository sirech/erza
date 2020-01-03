if File.exist?('../files/cert')
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
