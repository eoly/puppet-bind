# Class: bind::params
#
class bind::params {

  case $::operatingsystem {
    'RedHat',
    'CentOS',
    'Amazon': {
      $packagenameprefix = 'bind'
      $servicename       = 'named'
      $binduser          = 'root'
      $bindgroup         = 'named'
      $config_dir        = '/etc'
      $working_dir       = '/var/named'
      $rfc1912_zones     = 'named.rfc1912.zones'
    }
    'Debian',
    'Ubuntu': {
      $packagenameprefix = 'bind9'
      $servicename       = 'bind9'
      $binduser          = 'bind'
      $bindgroup         = 'bind'
      $config_dir        = '/etc/bind'
      $working_dir       = '/var/cache/bind'
      $rfc1912_zones     = 'named.conf.default-zones'
    }
    default: {
      $packagenameprefix = 'bind'
      $servicename       = 'named'
      $binduser          = 'root'
      $bindgroup         = 'named'
      $config_dir        = '/etc/named'
      $working_dir       = '/var/named'
      $rfc1912_zones     = 'named.rfc1912.zones'
    }
  }

}

