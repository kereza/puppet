class xtradb {
	package {['percona-xtradb-cluster-server', 'percona-xtradb-cluster-client', 'percona-xtrabackup']:
		ensure => installed,
		
	}

	file {'/etc/mysql/my.cnf':
		content => template("xtradb/my.cnf.erb"),
		require => Package['percona-xtradb-cluster-server'],
	}
	
}
