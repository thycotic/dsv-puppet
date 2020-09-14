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
#   Specifies the TSS server tenant
#
# @param cred_id
#   Specifies the credential ID to be retrieved
#
# @param storage_name
#   Specifies the filename where the file will be installed (inside /tmp)
#
class tss_vault(
  String $username = 'sdk_test_app',
  String $password = 'password',
  String $tenant =  'tmg',
  Integer $cred_id = 1,
  String $storage_name = 'test-secret.txt'
) {

  package { 'tss-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }

  $cred = credential($username, $password, $tenant, $cred_id)

  file {"/tmp/${storage_name}":
    ensure  => 'present',
    content => $cred,
  }
}

# Commenting this out - we need it when running puppet apply, for some reason.
#include tss_vault
