# 
# Thycotic DevOps Secret Vault
#
# @param client_id
#    The client id used for authentication
#
# @param client_secret
#    The client secret used for authentication
#
# @param tenant
#    The tenant of the vault you are requesting access to
#
# @param secret_path
#    the path of the required secret
#

class thycotic_dsv::dsv(
    String $client_id,
    String $client_secret,
    String $tenant,
    String $secret_path,
){
  package { 'dsv-sdk':
    ensure   => 'installed',
    provider => 'puppet_gem',
  }

  $secret = dsv_secret($client_id, $client_secret, $tenant, $secret_path, $thycotic_dsv::metadata)
}
