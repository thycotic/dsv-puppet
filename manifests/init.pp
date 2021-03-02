# 
# Integrates with Thycotic Secrets
#
# @param metadata
#    Boolean value to determine if we want to return the metadata for a secret
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

class dsv(
  String $client_id,
  String $client_secret,
  String $tenant,
  String $secret_path,
  Boolean $metadata = false,
){
  package { 'dsv-sdk':
    ensure   => 'installed',
    provider => 'puppet_gem',
  }

  $secret = dsv_secret($client_id, $client_secret, $tenant, $secret_path, $metadata)
}
