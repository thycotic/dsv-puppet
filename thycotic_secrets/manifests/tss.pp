class thycotic_secrets::tss(
  String $username,
  String $password,
  String $tenant,
  String $secret_id,
){
  package { 'tss-sdk':
    ensure   => 'installed',
    provider => 'puppet_gem',
  }

  $secret = tss_secret($username, $password, $tenant, $secret_id, $thycotic_secrets::metadata)

  file {"/tmp/${thycotic_secrets::storage_name}":
    ensure  => 'present',
    content => $secret,
  }
}
