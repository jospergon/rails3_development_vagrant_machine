name "dev"

default_attributes(
  :rvm => {
    :version => '1.17.10',
    :user_installs => [
      {
        :user => "vagrant",
        :default_ruby => "1.9.3",
        :rubies => ["1.9.3 --disable-binary"],
        :group => ["vagrant"]
      }
    ]
  },
  :mysql => {
    :remove_anonymous_users => true,
    :remove_test_database => true,
    :server_root_password => "1234",
    :server_repl_password => "1234",
    :server_debian_password => "1234",
    :server => { :socket => "/var/lib/mysql/mysql.sock" },
    :bind_address => "0.0.0.0"
  }
)

run_list(
  'recipe[mysql::server]',
  'recipe[mysql::ruby]',
  'recipe[redisio::install]',
  'recipe[redisio::enable]',
  'recipe[rvm::user_install]',
  'recipe[rvm::user]',
  'recipe[rvm::vagrant]',
  'recipe[required_pkgs]',
  'recipe[mysql_permissions]'
)
