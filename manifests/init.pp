# vmwaretools class simply installs open-vm-tools, included by hiera virtual
class vmwaretools {
  # i have a suspicion this script will blow up on RHEL but haven't actually tried it
  case $::osfamily {
    'Debian': {
      package { 'open-vm-tools':
        ensure => 'latest',
      }
    }
    'RedHat': {
      package { 'net-tools':
        ensure => 'present',
      }
      package { 'open-vm-tools':
        ensure  => 'latest',
        require => Package['net-tools']
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
