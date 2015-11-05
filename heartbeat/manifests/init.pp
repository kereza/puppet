class heartbeat {
	package {'default-jdk':
		ensure => present,
	}


	package {'heartbeat':
		ensure => present,

	}
	
	file {'/etc/heartbeat/ha.cf':
		content => template("heartbeat/ha.cf.erb"),
		notify => Service['heartbeat'],
		require => Package['heartbeat'],
	}
	
	file {'/etc/heartbeat/authkeys':
		content => template("heartbeat/authkeys.erb"),
		notify => Service['heartbeat'],
		mode => 0600,
		require => Package['heartbeat'],
	}

	file {'/etc/heartbeat/haresources':
		content => template("heartbeat/haresources.erb"),
                notify => Service['heartbeat'],
        	require => Package['heartbeat'],
	}
	
	file {'/etc/init.d/updateIP':
                content => template("heartbeat/updateIP.erb"),
                notify => Service['heartbeat'],
        	mode => 0755,
	}


	service {'heartbeat':
		ensure => running,
		enable => true,
		require => Package['heartbeat'],
	}
	
}
