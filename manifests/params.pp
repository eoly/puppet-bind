# Class: bind::params
#
class bind::params {

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
      $root_servers       = '/var/named/named.ca'
      $dump_file          = 'data/cache_dump.db'
      $statistics_file    = 'data/named_stats.txt'
      $memstatistics_file = 'data/named_mem_stats.txt'
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
      $root_servers       = '/etc/bind/db.root'
      $dump_file          = 'cache_dump.db'
      $statistics_file    = 'named_stats.txt'
      $memstatistics_file = 'named_mem_stats.txt'
    }
    default: {
      $packagenameprefix  = 'bind'
      $servicename        = 'named'
      $binduser           = 'root'
      $bindgroup          = 'named'
      $config_dir         = '/etc/named'
      $working_dir        = '/var/named'
      $rfc1912_zones      = 'named.rfc1912.zones'
      $root_servers       = '/var/named/named.ca'
      $dump_file          = 'data/cache_dump.db'
      $statistics_file    = 'data/named_stats.txt'
      $memstatistics_file = 'data/named_mem_stats.txt'
    }
  }

}

