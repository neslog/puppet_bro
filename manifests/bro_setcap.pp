class profile::bro_setcap {

file { '/opt/bro':
    owner => 'bro',
    recurse => true,
    }

file { '/var/opt/bro':
    owner => 'bro',
    recurse => true,
    }

exec { '/usr/sbin/setcap cap_net_raw,cap_net_admin=eip /opt/bro/bin/bro':
    unless => '/usr/sbin/getcap /opt/bro/bin/bro | grep "net_admin"'
  }

exec { '/usr/sbin/setcap cap_net_raw,cap_net_admin=eip /opt/bro/bin/capstats':
    unless => '/usr/sbin/getcap /opt/bro/bin/capstats | grep "net_admin"'
  }
  
}
