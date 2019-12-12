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

#  exec { 'coreutilsForCat':
#	command => '/usr/bin/apt-get install coreutils',
#	require => Exec['apt-update'],
#       }

#  exec { 'getIpAddresses':
#	require => Exec['coreutilsForCat'],
#        command => '/usr/bin/cat /vagrant/ipHosts.txt | sudo tee -a /etc/hosts'
#      }

#  exec { 'setUserPassword':
#	command => '/usr/bin/sudo passwd root',
#	require => Exec['apt-update'],
#       }

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

# file { 'etc/hosts':
#	ensure => present,
#	source => 'puppet://environments/server_config/ipHosts',
#	path => '/etc/hosts'
#	}

}
