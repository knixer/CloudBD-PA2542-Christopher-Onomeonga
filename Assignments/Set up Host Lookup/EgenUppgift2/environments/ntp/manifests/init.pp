class ntp {

#installera ntp
  exec { 'puppetlabs-ntp':
	command => '/usr/bin/puppet module install puppetlabs-ntp'
	}


	#servers => ['ntp1.corp.com', 'ntp2.corp.com' ],
}