define nfs::export ($ensure=present,
                    $share,
                    $options="",
                    $guest) {

  include concat::setup

#  concat { '/etc/exports':
#    owner   => 'root',
#    group   => 'root',
#    mode    => '0644',
#  }

  file { "$share":
    ensure => 'directory',
    owner => 'nfsnobody',
    group => 'nfsnobody',
  }

  $concatshare = regsubst($share, '/', '-', 'G')
  $concatguest = regsubst($guest, '/','-', 'G')
 
  if $options == "" {
    $content = "${share}     ${guest}\n"
  } else {
    $content = "${share}     ${guest}($options)\n"
  }

  concat::fragment {"${concatshare}-on-${concatguest}":
    order   => '10',
    content => "$content",
    target  => '/etc/exports',
    require => File["$share"],
  }

  

}


