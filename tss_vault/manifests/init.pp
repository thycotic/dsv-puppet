# 
#
# Integrates with Thycotic's TSS Server
#
# @param username
#    Specifies username for TSS Server
#
# @param password
#    Specifies password for TSS Server
#
# @param tenant
#   Specifies the DSV/TSS server tenant
#
# @param cred_id
#   Specifies the TSS credential ID to be retrieved
#
# @param storage_name
#   Specifies the filename where the file will be installed (inside /tmp)
#
# @param client_id
#   Specifies the DSV Client ID
#
# @param client_secret
#   Specifies the DSV Client Secret
#
# @param secret_path
#   Specifies the path to the secret for DSV
#
class tss_vault(
  String $username = 'sdk_test_app',
  String $password = 'test_password',
  String $tenant =  'tmg',
  Integer $cred_id = 1,
  String $storage_name = 'test-secret.txt',
  String $client_id = 'test_client_id',
  String $client_secret = 'test_client_secret',
  String $secret_path = '/test/secret'
) {

  package { 'tss-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }

  package { 'dsv-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }

  if $facts['use_tss'] {
    $cred = tss_credential($username, $password, $tenant, $cred_id)
  } else {
    $cred = dsv_credential($client_id, $client_secret, $tenant, $secret_path)
  }

  file {"/tmp/${storage_name}":
    ensure  => 'present',
    content => $cred,
  }
}

# Commenting this out - we need it when running puppet apply, for some reason.
#include tss_vault
