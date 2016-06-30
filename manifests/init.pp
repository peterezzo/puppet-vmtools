class vmwaretools {
    # only setup to use open-vm-tools at the moment
    if $osfamily == 'Debian' {
        package { 'open-vm-tools':
              ensure => 'latest',
        }
    }
}
