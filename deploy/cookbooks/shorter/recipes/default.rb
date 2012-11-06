# Install packages we want
package "python-django"

# Create directory to clone app into
directory "/opt/shorter" do
    owner "root"
    group "root"
    mode 0775
end

git "/opt/shorter/" do
    repository "git://github.com/grado/shorter.git"
    reference "HEAD"
    action :sync
    enable_submodules true
end
