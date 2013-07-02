# Class: bind::params
#
class bind::params {

  $dnssec_enable      = 'yes'
  $dnssec_validation  = 'yes'
  $dnssec_lookaside   = 'auto'

  case $::operatingsystem {
    'RedHat',
    'CentOS',
    'Amazon': {
      $packagenameprefix  = 'bind'
      $servicename        = 'named'
      $binduser           = 'root'
      $bindgroup          = 'named'
      $config_dir         = '/etc'
      $working_dir        = '/var/named'
      $rfc1912_zones      = 'named.rfc1912.zones'
      $rfc1912_zones_tpl  = 'named.rfc1912.zones.rhel.erb'
      $root_servers       = '/var/named/named.ca'
      $dump_file          = 'data/cache_dump.db'
      $statistics_file    = 'data/named_stats.txt'
      $memstatistics_file = 'data/named_mem_stats.txt'
      $bindkeys_file      = 'named.iscdlv.key'
    }
    'Debian',
    'Ubuntu': {
      $packagenameprefix  = 'bind9'
      $servicename        = 'bind9'
      $binduser           = 'bind'
      $bindgroup          = 'bind'
      $config_dir         = '/etc/bind'
      $working_dir        = '/var/cache/bind'
      $rfc1912_zones      = 'named.conf.default-zones'
      $rfc1912_zones_tpl  = 'named.rfc1912.zones.debian.erb'
      $root_servers       = '/etc/bind/db.root'
      $dump_file          = 'cache_dump.db'
      $statistics_file    = 'named_stats.txt'
      $memstatistics_file = 'named_mem_stats.txt'
      $bindkeys_file      = 'bind.keys'
    }
    default: {
      $packagenameprefix  = 'bind'
      $servicename        = 'named'
      $binduser           = 'root'
      $bindgroup          = 'named'
      $config_dir         = '/etc/named'
      $working_dir        = '/var/named'
      $rfc1912_zones      = 'named.rfc1912.zones'
      $rfc1912_zones_tpl  = 'named.rfc1912.zones.rhel.erb'
      $root_servers       = '/var/named/named.ca'
      $dump_file          = 'data/cache_dump.db'
      $statistics_file    = 'data/named_stats.txt'
      $memstatistics_file = 'data/named_mem_stats.txt'
      $bindkeys_file      = 'named.iscdlv.key'
    }
  }

}

