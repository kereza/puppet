class nagios {
	package {'nagios-nrpe-server':
		ensure => installed
	}

	file {'/etc/nagios/nrpe.cfg':
		content => template("nagios/nrpe.cfg.erb"),
		notify => Service["nagios-nrpe-server"],
		require => Package['nagios-nrpe-server'],
	}

	service {'nagios-nrpe-server':
		ensure => running,
		enable => true,
		require => Package['nagios-nrpe-server'],
	}

}

