name "mysql-redis"

default_attributes()

run_list(
  "recipe[apt]",
  "recipe[mysql_install]",
  "recipe[redisio]",
  "recipe[redisio::enable]",
  "recipe[required_pkgs]",
  "recipe[mysql_permissions]",
  "recipe[phpmyadmin]"
)
