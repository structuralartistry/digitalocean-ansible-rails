# Rails dev box

A default Rails machine using Ansible to provision it. 

This box provides the core packages needed for typical Rails 4 apps and nothing else.

The ultimate goal here is to be able to boot up a new Ruby on Rails VM more or less instantly.

## Installs

+ RVM
+ Postgres
+ Git
+ Image Magick

## Use

First time

```
vagrant up
```

Once the machine has been set up

```
vagrant up --no-provision
```

## Workflow

The idea is you work and edit your files locally but run the app inside your VM.

To view the files inside your VM cd into /vagrant

```
cd /vagrant
```
