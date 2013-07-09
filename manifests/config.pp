class bind::config (
  $acls               = {},
  $masters            = {},
  $listen_on_port     = '53',
  $listen_on_addr     = [ '127.0.0.1' ],
  $listen_on_v6_port  = '53',
  $listen_on_v6_addr  = [ '::1' ],
  $forwarders         = [],
  $working_dir        = $bind::params::working_dir,
  $config_dir         = $bind::params::config_dir,
  $version            = undef,
  $dump_file          = $bind::params::dump_file,
  $statistics_file    = $bind::params::statistics_file,
  $memstatistics_file = $bind::params::statistics_file,
  $enable_logging     = $bind::params::enable_logging,
  $log_dir            = $bind::params::log_dir,
  $log_name           = $bind::params::log_name,
  $allow_query        = [ 'localhost' ],
  $allow_query_cache  = [],
  $recursion          = 'yes',
  $allow_recursion    = [],
  $allow_transfer     = [],
  $check_names        = [],
  $dnssec_enable      = $bind::params::dnssec_enable,
  $dnssec_validation  = $bind::params::dnssec_validation,
  $dnssec_lookaside   = $bind::params::dnssec_lookaside,
  $bindkeys_file      = $bind::params::bindkeys_file,
  $zones              = {},
  $includes           = []
) inherits bind::params {

  if $enable_logging == 'yes' {
    file { $log_dir:
      require => Class['bind::package'],
      ensure  => directory,
      mode    => 0770,
      owner   => 'root',
      group   => $bind::params::bindgroup,
      before  => Class['bind::service'],
    }

    file { "$config_dir/$bind::params::log_config_tpl":
      before  => File["$config_dir/named.conf"],
      ensure  => present,
      mode    => '0644',
      owner   => $bind::params::binduser,
      group   => $bind::params::bindgroup,
      content => template("${module_name}/$bind::params::log_config_tpl"),
      notify  => Class['bind::service'],
    }
  }

  file { "$config_dir/$bind::params::rfc1912_zones":
    ensure => present,
    mode   => '0644',
    owner  => $bind::params::binduser,
    group  => $bind::params::bindgroup,
    content => template("${module_name}/$bind::params::rfc1912_zones_tpl"),
    notify  => Class['bind::service'],
  }

  file { "$config_dir/named.conf":
    ensure  => present,
    mode    => '0644',
    owner   => $bind::params::binduser,
    group   => $bind::params::bindgroup,
    content => template("${module_name}/named.conf.erb"),
    notify  => Class['bind::service'],
  }

  file { "$config_dir/named.conf.local":
    ensure  => present,
    mode    => '0644',
    owner   => $bind::params::binduser,
    group   => $bind::params::bindgroup,
    content => template("${module_name}/named.conf.local.erb"),
    notify  => Class['bind::service'],
  }

  file { "$config_dir/named.conf.options":
    ensure  => present,
    mode    => '0644',
    owner   => $bind::params::binduser,
    group   => $bind::params::bindgroup,
    content => template("${module_name}/named.conf.options.erb"),
    notify  => Class['bind::service'],
  }

  File["$config_dir/$bind::params::rfc1912_zones"] -> File["$config_dir/named.conf.options"] -> File["$config_dir/named.conf.local"] -> File["$config_dir/named.conf"] 

}
