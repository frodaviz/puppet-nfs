class nfs::client::centos inherits nfs::base {

  package { "nfs-utils":
    ensure => present,
  }

  package { "rpcbind":
    ensure => present,
  }

  service { "rpcbind":
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => [Package["rpcbind"], Package["nfs-utils"]],
  }

  service { "nfs":
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => [Package["rpcbind"], Package["nfs-utils"]],
  }


  service {"nfslock":
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => [Package["rpcbind"], Package["nfs-utils"]],
  }
 
#  service { "netfs":
#    enable  => true,
#    require => $lsbmajdistrelease ? {
#      6       => Service["nfslock"],
#      default => [Service["portmap"], Service["nfslock"]],
#    },
#  }

}
