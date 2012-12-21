====================
NFS Puppet module
====================

This module is provided to you by Camptocamp_.

.. _Camptocamp: http://www.camptocamp.com/

------------
Dependencies
------------
You have to configure your puppetmaster so that exported ressources will work.

--------
Examples
--------
Client node ::

  include nfs::client

  nfs::mount {"my mounted one":
    share       => '/srv/nfs/rofolder',
    mountpoint  => '/mnt/nfs/myshare',
    ensure      => present,
    server      => "nfs.mydomain.ltd",
  }

  nfs::mount {"my unwanted one":
    share       => '/srv/nfs/rwfolder',
    mountpoint  => '/mnt/nfs/myshare',
    ensure      => absent,
    server      => "nfs.mydomain.ltd",
  }


Server node ::

  include nfs::server

  # Nfs::Export <<| tag == "nfs.mydomain.ltd" |>>

  nfs::export { "RO folder":
    ensure  => present,
    share   => '/srv/nfs/rofolder',
    guest   => '*',
    options => 'ro,sync,all_squash',
  }

  nfs::export { "RW folder":
    ensure  => present,
    share   => '/srv/nfs/rwfolder',
    guest   => '192.168.0.100/32',
    options => 'rw,sync,all_squash',
  }


-------------
Documentation
-------------
http://reductivelabs.com/trac/puppet/wiki/ExportedResources
