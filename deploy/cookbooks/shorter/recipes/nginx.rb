include_recipe "nginx"

# add shorter to nginx sites-enabled
cookbook_file "#{node[:nginx][:dir]}/sites-available/default" do
    source "nginx/shorter"
    mode 0644
    owner "root"
    group "root"
    notifies :reload, "service[nginx]"
end

# overwrite default nginx config with our own
cookbook_file "#{node[:nginx][:dir]}/nginx.conf" do
    source "nginx/nginx.conf"
    mode 0644
    owner "root"
    group "root"
end
