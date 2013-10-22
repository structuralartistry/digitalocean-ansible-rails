# Rails dev box

Builds an Ubuntu Linux VM for Rails development using Ansible and Vagrant.

This box provides the core packages needed for typical Rails 4 apps and nothing else.

The ultimate goal here is to be able to boot up a new Ruby on Rails VM more or less instantly.

## Installs

+ RVM
+ MySQL
+ Postgres (optional)
+ Git

# TODO 

+ NGINX

## Use

```
vagrant up
# Provision the VM
./deploy.sh

# SSH into your new VM
vagrant ssh

# Everything inside /vagrant is shared with your local file system

cd /vagrant
sudo gem install --no-rdoc --no-ri rails

# Create your app
rails new myapp
cd myapp
# Create and migrate the database
bundle exec rake db:create && rake db:migrate
```

## Workflow

The idea is you work and edit your files locally but run the app inside your VM. 

All the files in your current directory (where your vagrant file is)
can be viewed in your VM in /vagrant once you SSH in to the box.

## Misc

```
ansible -m ping all -i provisioning/hosts -u vagrant --private-key=~/.vagrant.d/insecure_private_key

```

