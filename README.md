# Rails dev box

A default Rails machine using Ansible to provision it. 

This box provides the core packages needed for typical Rails 4 apps and nothing else.

The ultimate goal here is to be able to boot up a new Ruby on Rails VM more or less instantly.

## Installs

+ RVM
+ Postgres
+ Git
+ Redis (optional)

# TODO 

+ NGINX

![](https://dl.dropboxusercontent.com/u/6475135/rails-dev-box.png)

## Use

Be aware that the first time you run vagrant up the Ruby install will a long time!!!!!!! (couple of minutes for me))

```
vagrant up
vagrant ssh

# Everything inside /vagrant is shared with your local file system
cd /vagrant
sudo gem install --no-rdoc --no-ri rails
# Create your app
rails new myapp -d postgresql
cd myapp
# Create and migrate the database
bundle exec rake db:create && rake db:migrate
```

## Workflow

The idea is you work and edit your files locally but run the app inside your VM. 

All the files in your current directory (where your vagrant file is)
can be viewed in your VM in /vagrant once you SSH in to the box.

