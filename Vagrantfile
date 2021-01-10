# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # The most common configuration options are documented and commented below.
  config.vm.box = 'generic/ubuntu2004'

  config.vm.define :'erza-vagrant' do |erza|
    erza.vm.provision 'shell', inline: <<-SHELL
        apt update -qq
        apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

        apt update -qq
        apt install -y docker-ce docker-ce-cli containerd.io
    SHELL
  end

  config.vm.define :'natsu-vagrant' do |natsu|
    natsu.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'playbook.yml'
      ansible.extra_vars = {
        'host' => 'natsu'
      }
    end
  end
end
