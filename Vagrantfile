Vagrant.configure("2") do |config|

  config.vm.box      = 'precise32'
  config.vm.box_url  = 'http://files.vagrantup.com/precise32.box'
  config.vm.hostname = 'rails-dev-box'
  
  config.vm.network :private_network, ip: "192.168.111.222"

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :ansible do |ansible|
      ansible.playbook       = "provisioning/playbook.yml"
      ansible.inventory_file = "provisioning/ansible_hosts"
      ansible.sudo           =  true
    end
end 
