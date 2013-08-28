# Rails dev box

A default Rails machine using Ansible to provision it. 

This box provides the core packages needed for typical Rails 4 apps and nothing else.

The ultimate goal here is to be able to boot up a new Ruby on Rails VM more or less instantly.

## Installs

+ RVM
+ Postgres
+ Git
+ RMagic (optional)
+ Redis (optional)

# TODO 

+ NGINX

![](https://dl.dropboxusercontent.com/u/6475135/rails-dev-box.png)

## Use

First time (bear in mind the latest Ruby install will take a long time!)

```
vagrant up
```

There are some language configuration issues with Postgres I haven't quite resolved yet.

This will eventually be automated when I get some time to fix.

To fix postgres for rails 

```
sudo su postgres
psql -f /home/vagrant/lang.sql
sudo su vagrant
```

## Workflow

The idea is you work and edit your files locally but run the app inside your VM. 

All the files in your current directory (where your vagrant file is)
can be viewed in your VM in /vagrant once you SSH in to the box.

Log in to your new VM

```
vagrant ssh
```

To view the files inside your VM cd into /vagrant

```
cd /vagrant && rails new myapp
```
