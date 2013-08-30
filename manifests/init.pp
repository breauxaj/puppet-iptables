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
