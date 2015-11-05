class phpcgi {
	package {'php5-cgi':
		ensure => installed,
	}

	package {['php5-curl', 'php5-gd', 'php5-mcrypt', 'php5-memcache', 'php5-mysql']:
		ensure => installed,
		require => Package['php5-cgi'],
	
	}

	file {'/etc/php5/mods-available/memcache.ini':
		content => template("phpcgi/memcache.ini.erb"),
		require => Package['php5-memcache'],
	}

	 file {'/etc/php5/cgi/php.ini':
                content => template("phpcgi/php.ini.erb"),
                require => Package['php5-cgi'],
        }




}
