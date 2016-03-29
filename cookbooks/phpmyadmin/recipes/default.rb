package 'phpmyadmin' do
  action :install
end

mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => '1234'
}

mysql_database 'phpmyadmin' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'phpmyadmin' do
  connection    mysql_connection_info
  password      node['phpmyadmin']['database']['password']
  database_name 'phpmyadmin'
  host          '%'
  privileges    [:select,:update,:insert]
  action        :grant
end

bash 'crate_phpmyadmin_tables' do
  cwd ::File.dirname(node['phpmyadmin']['tables']['dir'])
  code <<-EOH
    mysql -u root -p"#{node['mysql_install']['root_password']}" -h 127.0.0.1 phpmyadmin < "#{node['phpmyadmin']['tables']['dir']}mysql"
    EOH
end

template '/etc/phpmyadmin/config-db.php' do
  source 'config-db.php.erb'
  owner 'root'
  group 'root'
  mode 00644
end

bash 'include_phpmyadmin' do
  cwd ::File.dirname('/root')
  code <<-EOH
    echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
    EOH
end

service "apache2" do
  action :restart
end
