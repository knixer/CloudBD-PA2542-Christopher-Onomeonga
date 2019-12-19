node appserver {
  class { 'server_config':
    package_name => 'nodejs',
    service_name => 'apache2',
  }

}

node dbserver {
 class { 'server_config':
    package_name => 'mysql-server',
    service_name => 'apache2',
  }
}

node vagrant-test {
 class { 'server_config':
    package_name => 'apache2',
    service_name => 'apache2',
  }
}