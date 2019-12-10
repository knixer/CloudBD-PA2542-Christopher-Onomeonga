class mysql {

	package { 'mysql-server':
		ensure => present;
	}

	service { 'mysql':
		ensure => running,
		require => Package['mysql-server']
	}

#	exec { 'set-mysql-password':
#		command => 'mysqladmin -u root -p root',
#		path => '/usr/bin',
#		require => Service['mysql']
#	}

#	file { '/etc/mysql/my.cnf':
#		source => 'puppet:///environments/mysql/my.cnf',
#		ensure => present,
#		path => '/tmp/my.cnf',
#		require => Package['mysql-server'],
#		notify => Service['mysql']
#	}
	
#	exec { 'initiate':
#		command => 'sudo mysql ALTER USER \'root\'@\'localhost\' IDENTIFIED WITH mysql_native_password BY \'password\'',
#		path => '/usr/bin',
#		require => Service['mysql']
#	}

#	exec { 'initiate2':
#		command => 'ALTER USER \'root\'@\'localhost\' IDENTIFIED WITH mysql_native_password BY \'password\'',
#		path => '/usr/bin',
#		require => Exec['initiate']
#	}


#	mysql::db {'mydb':
#	  user => 'root',
#	  password => 'root',
#	  host => 'localhost',
#	  grant => ['SELECT', 'UPDATE']
#	}
}