class server_config (
  $package_name = 'apache2',
  $service_name = 'apache2',
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

notify {"Server started on ${ipaddress} with the name ${hostname}":}


}
