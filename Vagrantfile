Vagrant.configure("2") do |config|

  config.vm.box      = 'precise64'
  config.vm.box_url  = 'http://files.vagrantup.com/precise64.box'

  config.vm.define :web do |web_config|

    web_config.vm.hostname = 'web'
  
    # Network
    web_config.vm.network :private_network, ip: "33.33.33.10"
    # web_config.vm.network :forwarded_port, guest: 3000, host: 3000
    # web_config.vm.network :forwarded_port, guest: 80, host: 8080
    # 
    web_config.vm.synced_folder ".", "/var/www"
  end
  
  # Database server
  config.vm.define :db do |db_config|

    db_config.vm.hostname = 'db'
    
    # Network
    db_config.vm.network :private_network, ip: "33.33.33.20"
    db_config.vm.network :forwarded_port, guest: 5432, host: 5432
  end
  
  # add a bit more memory, it never hurts. It's VM specific and we're using Virtualbox here.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end
end 
