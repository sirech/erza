define :add_lock do
  package 'curl'

  destination = '/usr/local/bin/lock'
  execute "curl -fsSL https://github.com/sirech/lock/releases/download/v#{node[:lock_version]}/lock-x86_64-unknown-linux-musl -o /tmp/lock" do
    not_if "test -f #{destination}"
  end

  execute 'chmod +x /tmp/lock' do
    not_if "test -f #{destination}"
  end

  execute "mv /tmp/lock #{destination}" do
    not_if "test -f #{destination}"
  end
end
