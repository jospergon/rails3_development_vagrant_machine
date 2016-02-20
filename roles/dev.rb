name "dev"

default_attributes(
  postgresql: {
    password: {
      postgres: "md555815376ec01aad10c02f6f9c7eab340"
    },
    config: {
      listen_addresses: "*"
    },
    pg_hba: [
      { type: 'local', db: 'all', user: 'postgres', addr: nil, method: 'ident'},
      { type:  'local', db:  'all', user:  'all', addr:  nil, method:  'ident'},
      { type:  'host', db:  'all', user:  'all', addr:  '127.0.0.1/32', method:  'md5'},
      { type:  'host', db:  'all', user:  'all', addr:  '10.0.2.2/32', method:  'md5'},
      { type:  'host', db:  'all', user:  'all', addr:  '::1/128', method:  'md5'}
    ]
  },
  apache: {
    listen: {
      "*" => ["80"]
    },
    default_site_enabled: true
  }
)

run_list(
  "recipe[apt]",
  "recipe[mysql_install]",
  "recipe[redisio]",
  "recipe[redisio::enable]",
  "recipe[required_pkgs]",
  "recipe[mysql_permissions]",
  "recipe[postgresql]",
  "recipe[postgresql::server]",
  "recipe[apache2]",
  "recipe[phppgadmin]"
)
