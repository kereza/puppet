node default {
   #This is where you can declare classes for all nodes.
   #Example:
#     class { 'motd': }
file { '/tmp/hello':
content => "Hello, world\n",
}

include ntp


}




