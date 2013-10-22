Vagrant.configure("2") do |config|

  # Web server
  config.vm.define :web do |web_config|
    web_config.vm.box      = 'precise64'
    web_config.vm.box_url  = 'http://files.vagrantup.com/precise64.box'
    web_config.vm.hostname = 'web'
  
    web_config.vm.network :private_network, ip: "192.168.111.222"

    web_config.vm.network :forwarded_port, guest: 3000, host: 3000
    
    # web_config.vm.network :forwarded_port, guest: 80, host: 8080
  
    # add a bit more memory, it never hurts. It's VM specific and we're using Virtualbox here.
    web_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 2048]
    end
  end
  
  # Database server
  config.vm.define :db do |db_config|
    db_config.vm.box = "precise64"
    db_config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    db_config.vm.hostname = 'db'
    
    db_config.vm.network "private_network", ip: "192.168.111.333"
    db_config.vm.network :forwarded_port, guest: 5432, host: 5432
  end
end 
