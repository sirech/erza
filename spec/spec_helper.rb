require 'serverspec'
require 'net/ssh'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

options = if host =~ /vagrant/
            require 'tempfile'

            config = Tempfile.new('', Dir.tmpdir)
            config.write(`vagrant ssh-config #{host}`)
            config.close

            Net::SSH::Config.for(host, [config.path])
          else
            Net::SSH::Config.for(host)
          end

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options

def ci_user
  'ci'.freeze
end

def ci_home
  "/home/#{ci_user}".freeze
end
