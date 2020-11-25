
class thycotic_secrets::dsv(
    String $client_id,
    String $client_secret,
    String $tenant,
    String $secret_path,
){
  package { 'dsv-sdk':
    ensure   => 'installed',
    provider => 'puppet_gem',
  }

  $secret = dsv_secret($client_id, $client_secret, $tenant, $secret_path, $thycotic_secrets::metadata)

  file {"/tmp/${thycotic_secrets::storage_name}":
    ensure  => 'present',
    content => $secret,
  }
}




