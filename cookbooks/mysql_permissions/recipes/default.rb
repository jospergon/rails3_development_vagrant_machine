mysql2_chef_gem 'default' do
  action :install
end

mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => '1234'
}

mysql_database_user 'root' do
  connection    mysql_connection_info
  database_name '*.*'
  host          '%'
  privileges    [:all]
  action        :grant
end
