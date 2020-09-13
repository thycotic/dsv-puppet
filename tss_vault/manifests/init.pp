class tss_vault(
  String $username = 'jptest4'
) {
  package { 'tss-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }

  file {"/tmp/{$username}":
    ensure  => 'present',
    content => 'server 0.centos.pool.ntp.org iburst\n',
  }
}

include tss_vault
