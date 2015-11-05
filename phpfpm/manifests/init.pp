class phpfpm {
	package {  ['php5-fpm',  'php5-memcache', 'php5-memcached', 'php5-curl', 'php5-mcrypt', 'php5-gd', 'php5-mysql'] :	
		ensure => installed,
	}

	file {'/etc/php5/fpm/pool.d/www.conf':
                content => template('phpfpm/www.conf.erb'),
                notify  => Service['php5-fpm'],
		require => Package['php5-fpm'],
        }

	file {'/etc/php5/fpm/php.ini':
                content => template('phpfpm/php.ini.erb'),
                notify  => Service['php5-fpm'],
                require => Package['php5-fpm'],
        }

	service {'php5-fpm':
                ensure  => running,
                enable  => true,
                require => Package['php5-fpm'],

        }

	exec {'php5enmod':
		command => "/usr/sbin/php5enmod mcrypt",
		#requires => Package['php5-mcrypt'],
	}

       file {'/etc/php5/mods-available/memcache.ini':
                content => template('phpfpm/memcache.ini.erb'),
                notify  => Service['php5-fpm'],
               require => Package['php5-memcache'],
        }


}
