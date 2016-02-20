package 'phppgadmin' do
  action :install
end

template '/etc/phppgadmin/config.inc.php' do
  source 'config.inc.php.erb'
  owner 'root'
  group 'root'
  mode 00644
end

apache_module 'mpm_event' do
  enable false
end

apache_module "mpm_prefork" do
  enable true
end

cookbook_file '/etc/apache2/conf-available/phppgadmin.conf' do
  source 'phppgadmin'
  owner 'root'
  group 'root'
  mode 00644
end

apache_config 'phppgadmin' do
  conf_path '/etc/apache2/conf-available/'
  enable true
end

# directory '/etc/apache2/conf.d' do
#   owner 'root'
#   group 'root'
#   mode 00755
#   recursive true
#   action :create
# end



service "apache2" do
  action :restart
end
