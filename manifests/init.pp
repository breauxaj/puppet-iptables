class iptables {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'iptables' ],
  }

  package { $required: ensure => latest }

}

define iptables::service ( $ensure,
                           $enable ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'iptables',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

define iptables::sysconfig ( $modules,
                             $modules_unload = 'yes',
                             $save_on_stop = 'no',
                             $save_on_restart = 'no',
                             $save_counter = 'no',
                             $status_numeric = 'yes',
                             $status_verbose = 'no',
                             $status_linenumbers = 'yes',
                             $sysctl_load_list = [ '.nf_conntrack', '.bridge-nf' ] ) {
  file { '/etc/sysconfig/iptables-config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('iptables/iptables-config.erb'),
  }

}

define iptables::rule () {


}