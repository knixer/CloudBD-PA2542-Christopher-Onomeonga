#stage {'last':
#  subscribe => Stage['main']
#}

#class { 'ntp':
#  stage => last,
#}

node appserver {
  class { 'server_config':
    package_name => 'nodejs',
    service_name => 'apache2',
  }

}
node dbserver {

include mysql
# class { 'mysql::mysql':
#    package_name => 'mysql-server',
#    service_name => 'apache2',
#  }
}

node web {
  class { 'server_config':
    package_name => 'nginx',
    service_name => 'apache2',
  }
}
node /ts*/ {
  class { 'server_config':
    package_name => 'apache2',
    service_name => 'apache2',
  }
#  include ntp
}

node proxyserver {
  class { 'server_config':
    package_name => 'apache2',
    service_name => 'apache2',
    proxyserver => true,
  }
#  include ntp
}
