class openssl {
	include nginxlb

	package {'openssl':
		ensure => present,
	}

	file {"/etc/nginx/ssl":
		ensure => directory,
		require => Package['nginx'],
	}


	file {"/etc/nginx/ssl/example.com":
		source => "puppet:///modules/openssl/example.com",
		recurse => true,
		require => Package['nginx'],
	}		
}
