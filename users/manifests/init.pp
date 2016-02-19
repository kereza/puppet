class users {
	user {'kereza':
		ensure => present,
		home => "/home/kereza",
		managehome => yes,
	}

	file {"/home/kerezaz":
		ensure => present,
	}

	file {"/home/kereza/ec2":
		source => "puppet:///modules/users/ec2",
		recurse => true,
		require => File["/home/kereza"],
	}		  

}
