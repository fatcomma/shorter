# Install packages we want

#package "python-setuptools"
#package "python-dev"
#package "build-essential"
#package "git-core"

package "python-django"

#python_pip "django" do
#    action :install
#end

#python_pip "gunicorn" do
#    action :install
#end

#node[:users].each_pair do |username, info|
#    group username do
#       gid info[:id] 
#    end
#
#    user username do 
#        comment info[:full_name]
#        uid info[:id]
#        gid info[:id]
#        shell info[:disabled] ? "/sbin/nologin" : "/bin/bash"
#        supports :manage_home => true
#        home "/home/#{username}"
#    end
#
#    directory "/home/#{username}/.ssh" do
#        owner username
#        group username
#        mode 0700
#    end
#
#    file "/home/#{username}/.ssh/authorized_keys" do
#        owner username
#        group username
#        mode 0600
#        content info[:key]
#    end
#end
#
#node[:groups].each_pair do |name, info|
#    group name do
#        gid info[:gid]
#        members info[:members]
#    end
#end
# Create directory to clone app into
directory "/opt/shorter" do
    owner "root"
    group "root"
    mode 0775
end

git "/opt/shorter/" do
    repository "git://github.com/grado/sansa.git"
    reference "HEAD"
    action :sync
end

#mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}
#
#mysql_database_user 'disenfranchised' do
#    connection mysql_connection_info
#    password 'djangotest'
#    action :create
#end
#
#mysql_database 'django_db' do
#    connection mysql_connection_info
#    action :create
#end 

# --- Install packages we need ---
#package 'ntp'
#package 'sysstat'
#package 'apache2'

# --- Add the data partition ---
#directory '/mnt/data_joliss'

#mount '/mnt/data_joliss' do
#  action [:mount, :enable]  # mount and add to fstab
#  device 'data_joliss'
#  device_type :label
#  options 'noatime,errors=remount-ro'
#end

# --- Set host name ---
# Note how this is plain Ruby code, so we can define variables to
# DRY up our code:
#hostname = 'opinionatedprogrammer.com'

#file '/etc/hostname' do
#  content "#{hostname}\n"
#end

#service 'hostname' do
#  action :restart
#end

#file '/etc/hosts' do
#  content "127.0.0.1 localhost #{hostname}\n"
#end

# --- Deploy a configuration file ---
# For longer files, when using 'content "..."' becomes too
# cumbersome, we can resort to deploying separate files:
#cookbook_file '/etc/apache2/apache2.conf'
# This will copy cookbooks/op/files/default/apache2.conf (which
# you'll have to create yourself) into place. Whenever you edit
# that file, simply run "./deploy.sh" to copy it to the server.

#service 'apache2' do
#  action :restart
#end
