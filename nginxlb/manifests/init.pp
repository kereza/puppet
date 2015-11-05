class nginxlb {
	package {'nginx':
		ensure => installed,
	}


	file {'/etc/nginx/sites-available/default':
		ensure => absent,
	}

	
	file {'/etc/nginx/sites-available/example.com':
		content => template('nginxlb/example.com.erb'),
		notify  => Service['nginx'],
	}


	file {'/etc/nginx/sites-enabled/example.com':
		ensure => link,
		target => "/etc/nginx/sites-available/example.com",
	}

	service {'nginx':
		ensure  => running,
		enable  => true,
		require => Package["nginx"], 

	}

}
