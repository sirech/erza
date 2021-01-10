# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # The most common configuration options are documented and commented below.
  config.vm.box = 'generic/ubuntu2004'

  config.vm.define :'erza-vagrant' do |erza|
    erza.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'playbook.yml'
      ansible.extra_vars = {
        'host' => 'erza'
      }
    end
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
