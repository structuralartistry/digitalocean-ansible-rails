# Rails dev box

Builds an Ubuntu Linux VM for Rails development using Ansible and Vagrant.

This box provides the core packages needed for typical Rails 4 apps and nothing else.

The ultimate goal here is to be able to boot up a new Ruby on Rails VM more or less instantly.

There are currently a couple of steps you need to go through to get Postgres working nicely.

## Installs

+ Ruby 2
+ Postgres
+ Nginx

## Use

```
# Bring both the webserver and db server online
vagrant up
# Provision the VM
./deploy.sh

# SSH into your new VM
vagrant ssh web

# Everything inside /vagrant is shared with your local file system

cd /vagrant

# Create your app
sudo gem install --no-rdoc --no-ri rails
sudo rails new myapp --database postgresql
cd myapp
# Create and migrate the database
bundle exec rake db:create && rake db:migrate
```

## Configure Postgres

Since postgres is running on a separate server we need to do some groundwork. Hopefully I'll find a way to automate this.

```  
vagrant ssh db
sudo -u postgres psql
postgres=#CREATE USER vagrant WITH SUPERUSER PASSWORD 'vagrant';

# You can now log in to postgres using the username vagrant and password vagrant
psql -h 192.168.111.223 -U vagrant -d mydb
````

### Fix postgres UTF8 issues

We need to fix some language issues with the default postgres install.

```
# Connect to DB server
vagrant ssh db

# Update languages

export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Update the template languages

sudo -u postgres psql

## Run the following SQL

update pg_database set datistemplate=false where datname='template1';
drop database template1;
create database template1 with owner=postgres encoding='UTF-8'
lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;

update pg_database set datistemplate=true where datname='template1';
```

You should now be able to connect to postgres from your web VM. An example DB config.yml is provided below

```
development:
  adapter: postgresql
  encoding: unicode
  database: blog_development
  pool: 5
  username: vagrant
  password: vagrant
  host: 33.33.33.20

test:
  adapter: postgresql
  encoding: unicode
  database: blog_test
  pool: 5
  username: vagrant
  password: vagrant
  host: 33.33.33.20

```

## Workflow

The idea is you work and edit your files locally but run the app inside your VM. 

All the files in your current directory (where your vagrant file is)
can be viewed in your VM in /vagrant once you SSH in to the box.

## Misc

Testing your SSH connection

```
ansible -m ping all -i devops/hosts -u vagrant --private-key=~/.vagrant.d/insecure_private_key

```

