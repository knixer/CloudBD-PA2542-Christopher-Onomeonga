class server_config (
  $package_name = 'apache2',
  $service_name = 'apache2',
  $proxyserver = false,
) {

  exec { 'apt-update':
	command => '/usr/bin/apt-get update',
	path => 'usr/bin'
  }

  package { 'curl':
	  require => Exec['apt-update'],
	  ensure => installed,

  }

  package { 'git':
          require => Exec['apt-update'],
	  ensure => installed,
  }

  package { 'grep':
          require => Exec['apt-update'],
	  ensure => installed,
  }

#  package { 'awk':
#          require => Exec['apt-update'],
#	  ensure => installed,
#  }

  if $package_name == 'nodejs' {


	exec { 'nodejsUpdate':
	command => '/usr/bin/sudo apt-get pruge nodejs curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -',
	#path => 'usr/bin'
        }

	package { 'nodejs':
	  require => Exec['nodejsUpdate'],
	  ensure => installed,
       }

	package {'npm':
	  require => Package['nodejs'],
	  ensure => installed,
	}




  }else{

        package { $package_name:
	require => Exec['apt-update'],
        ensure => installed,
        }
  }

  if $proxyserver == false {
	file { '/tmp/ipMaster.txt':
	  ensure => file,
	  content => "192.168.56.107",
    }
#        exec{ 'give ip':
#         command => '/usr/bin/ipMaster=192.168.56.107',
#    }
  }

#  service { $service_name:
#    ensure => running,
#    enable => true,
#  }

}
