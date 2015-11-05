class apache2 {
	package {'apache2':
		ensure => installed,
	}
	
	include users

	file { ['/etc/apache2/sites-available/000-default.conf', '/etc/apache2/sites-availabledefault-ssl.conf']:
                ensure => absent,
		require => Package['apache2'],
        }


        file {'/etc/apache2/sites-available/example.conf':
                content => template('apache2/example.conf.erb'),
                notify  => Service['apache2'],
		require => Package['apache2'],
        }


        file {'/etc/apache2/sites-enabled/example.conf':
                ensure => link,
                target => "/etc/apache2/sites-available/example.conf",
        	require => Package['apache2'],
	}

        service {'apache2':
                ensure  => running,
                enable  => true,
                require => Package["apache2"],

        }

	package {'libapache2-mod-fcgid':
		ensure => installed,
		require => Package['apache2'],

	}

	exec {'actions':
		command => "/usr/sbin/a2enmod actions",
		require => Package['apache2'],
	}

	exec {'include':
                command => "/usr/sbin/a2enmod include",
                require => Package['apache2'],
        }


	exec {'rewrite':
                command => "/usr/sbin/a2enmod rewrite",
                require => Package['apache2'],
        }


	exec {'suexec':
                command => "/usr/sbin/a2enmod suexec",
                require => Package['apache2'],
        }

	file {['/var/www/kereza', '/var/www/kereza/html',]:
		ensure => directory,
		mode => 0755,
		group => kereza,
		owner => kereza,
		require => [User['kereza'], Package['apache2']],
		
	}
	
	file {'/var/www/kereza/php-fcgi-starter':
                content => template('apache2/php-fcgi-starter.erb'),
		mode => 0755,
                require => File['/var/www/kereza', '/var/www/kereza/html'],
		owner => kereza,
		group => kereza,
        }

}
