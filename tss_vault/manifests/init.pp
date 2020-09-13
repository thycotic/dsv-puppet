class tss_vault(
  String $username = 'jptest4'
) {

  package { 'tss-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }
  $cred = credential('test')

  file {"/tmp/${username}":
    ensure  => 'present',
    content => "Meow: ${cred}",
  }
}

# Commenting this out - we need it when running puppet apply, for some reason.
#include tss_vault
