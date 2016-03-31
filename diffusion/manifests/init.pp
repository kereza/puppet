# Main Class
#
#.~B.| Parameters:
#   version = Version of jdk to configure. This is based on RPM name.
class diffusion ($version = '1.7.0') {

    # call our configure class
    class {'diffusion::configure':
        version => $version,
    }
}

