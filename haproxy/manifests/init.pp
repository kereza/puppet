class haproxy {
	package {'haproxy':
		ensure => installed,
	}

	file {'/etc/haproxy/haproxy.cfg':
		content => template('haproxy/haproxy.cfg.erb'),
		notify  => Service['haproxy'],
        }

	service {'haproxy':
                ensure  => running,
                enable  => true,
                require => Package["haproxy"],

        }

	package {'sysbench':
                ensure => installed,
        }


}

