class nfs::server(
  $service_enable = true,
) {
  case $operatingsystem {
    Debian,Ubuntu:  { include nfs::server::debian}
    CentOS:         { include nfs::server::centos}
    default:        { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

}
