# Rails dev box

A default Rails machine using Ansible to provision it. 

This box provides the core packages needed for typical Rails 4 apps and nothing else.

The ultimate goal here is to be able to boot up a new Ruby on Rails VM more or less instantly.

## Installs

+ RVM
+ Postgres
+ Git
+ Image Magick

![](https://dl.dropboxusercontent.com/u/6475135/rails-dev-box.png)

## Use

First time (bear in mind the latest Ruby install will take a long time!)

```
vagrant up
```

Once the machine has been set up

```
vagrant up --no-provision
```

## Workflow

The idea is you work and edit your files locally but run the app inside your VM.

Log in to your new VM

```
vagrant ssh
```

To view the files inside your VM cd into /vagrant

```
cd /vagrant && rails new myapp
```
