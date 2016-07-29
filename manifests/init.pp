# vmwaretools class simply installs open-vm-tools if necessary
# include everywhere and only run where virtual
class vmwaretools {
  if $::virtual == 'vmware' {
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
}
