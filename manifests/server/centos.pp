class nfs::server::centos inherits nfs::client::centos {

  include concat::setup

  concat { '/etc/exports':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  package {"nfs-utils-lib":
    ensure => present,
  }



  
#  exec {"reload_nfs_srv":
#    command     => "/etc/init.d/nfs-kernel-server reload",
#    onlyif      => '/etc/init.d/nfs-kernel-server status',
#    refreshonly => true,
#    require     => Package["nfs-kernel-server"]
#  }

#  service {"nfs-kernel-server":
#    enable  => $nfs::server::service_enable,
#    pattern => "nfs"
#  }

#  concat {'/etc/exports':
#    owner  => root,
#    group  => root,
#    mode   => '0644',
#    notify => Exec['reload_nfs_srv'],
#  }

}
