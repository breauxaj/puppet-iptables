define iptables::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'iptables',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
