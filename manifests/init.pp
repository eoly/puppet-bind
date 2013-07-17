# Class: bind
#
# Install and enable an ISC BIND server.
#
# Parameters:
#  $chroot:
#   Enable chroot for the server. Default: false
#  $packagenameprefix:
#   Package prefix name. Default: 'bind' or 'bind9' depending on the OS
#
# Sample Usage :
#  include bind
#  class { 'bind':
#    chroot            => true,
#    packagenameprefix => 'bind97',
#  }
#
class bind (
  $chroot            = false,
  $packagenameprefix = $bind::params::packagenameprefix
) inherits bind::params {

  # Main package and service
  $packagenamesuffix = $chroot ? {
    true  => '-chroot',
    false => '',
  }
 
  class { 'bind::package':
    packagenameprefix => $packagenameprefix,
    packagenamesuffix => $packagenamesuffix,
  }

  include bind::service

}

