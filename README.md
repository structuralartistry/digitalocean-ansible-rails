# Rails dev box

Builds an Ubuntu Linux VM for Rails development using Ansible and Vagrant.

This box provides the core packages needed for typical Rails 4 apps and nothing else.

The target setup is Ubuntu Linux, Unicorn and Nginx.

## Use

```
# Bring both the webserver and db server online
vagrant up
# Provision the VM
./deploy.sh

# SSH into your new VM
vagrant ssh web

# Everything inside /var/www is shared with your local file system

cd /var/www

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
# sudo -u postgres psql
# \password
# create user vagrant with password 'vagrant';
# create database mydb owner vagrant;
# \q

# You can now log in to postgres using the username vagrant and password vagrant
psql -h 33.33.33.20 -U vagrant -d mydb
````
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
