class nfs::client {
  case $operatingsystem {
    Debian,Ubuntu:  { include nfs::client::debian}
    RedHat:         { include nfs::client::redhat}
    CentOS:         { include nfs::client::centos}
    default:        { notice "Unsupported operatingsystem ${operatingsystem}" }
  }
}

