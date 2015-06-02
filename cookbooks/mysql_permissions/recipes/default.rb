mysql_connection_info = {
  :socket => '/var/lib/mysql/mysql.sock',
  :host     => 'localhost',
  :username => 'root',
  :password => '1234'
}

mysql_database_user 'root' do
  connection    mysql_connection_info
  password      '1234'
  database_name '*.*'
  host          '%'
  privileges    [:select,:update,:insert]
  action        :grant
end
