Vagrant.configure("2") do |config|

  config.vm.box      = 'precise64'
  config.vm.box_url  = 'http://files.vagrantup.com/precise64.box'

  config.vm.hostname = 'boxes-vm'
  
  config.vm.network :private_network, ip: "33.33.33.33"
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'playbooks/vagrant_box_defaults/main.yml'
    ansible.inventory_path = 'vagrant-hosts'
    ansible.verbose = 'vvvv'

    # this param seems to be equal to setting the same in the ansible yml, i think its better to do it there for consistency
    # ansible.sudo = true

    # had to add this (backward compat issue) to keep an error not to happen but dont fully understand why
    # if dont include this, there is an error saying the inventory file is empty 
    ansible.limit = 'all'
  end

end
