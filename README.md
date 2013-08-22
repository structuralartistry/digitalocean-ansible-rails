# Rails dev box

A default Rails machine using Ansible to provision it.

## Installs

+ RVM
+ Postgres
+ Git
+ Bundler

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