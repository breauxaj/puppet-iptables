class iptables {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'iptables' ],
  }

  package { $required: ensure => latest }

}
