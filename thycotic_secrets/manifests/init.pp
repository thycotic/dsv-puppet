# 
#
# Integrates with Thycotic Secrets
#
# @param dsv_config
#    Specifies several configuration options for DSV
#
# @param tss_config
#    Specifies several configuration options for TSS
#
# @param metadata
#    Boolean value to determine if we want to returnt the metadata for a secret
#
# @param mode
#    Determines whether we're accessing secrets for DSV or TSS
#
# @param storage_name
#   Specifies the filename where the file will be installed (inside /tmp)
class thycotic_secrets(
  Enum['dsv', 'tss'] $mode = 'dsv',
  Boolean $metadata = false,

  Hash $dsv_config = {
    'client_id' => 'aff24976-7832-40d7-8e3e-df893f38e18a',
    'client_secret' => 'unVqEpfuk315qNiXAKI-s1mHCA0qcHcDY4py8Y9ZvC4',
    'tenant' => 'tmg',
    'secret_path' => '/test/sdk/nested'
  },


  Hash $tss_config = {
    'username' => 'sdk_test_app',
    'password' => 'm3x8r6tA2nQR',
    'tenant' => 'tmg',
    'secret_id' => '1',
  },
  String $storage_name = 'test-secret.txt',
) {

  package { 'tss-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }

  package { 'dsv-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }

  if $mode == 'tss' {
    $secret = tss_secret($tss_config[username], $tss_config[password], $tss_config[tenant], $tss_config[secret_id], $metadata)
  } else {
    $secret = dsv_secret($dsv_config[client_id], $dsv_config[client_secret], $dsv_config[tenant], $dsv_config[secret_path], $metadata)
  }

  file {"/tmp/${storage_name}":
    ensure  => 'present',
    content => $secret,
  }
}
