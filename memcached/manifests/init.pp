class memcached {
	


	





	package {'memcached':
		ensure => installed
	}
	
	file {'/etc/memcached.conf':
                content => template('memcached/memcached.conf.erb'),
                notify  => Service['memcached'],
		require => Package['memcached'],
        }






	


	service {'memcached':
                ensure  => running,
                enable  => true,
                require => Package["memcached"],

        }


}
