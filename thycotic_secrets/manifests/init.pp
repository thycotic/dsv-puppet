# 
# Integrates with Thycotic Secrets
#
# @param metadata
#    Boolean value to determine if we want to return the metadata for a secret
#
# @param mode
#    Determines whether we're accessing secrets for DSV or TSS
#
# @param storage_name
#   Specifies the filename where the file will be installed (inside /tmp)

class thycotic_secrets(
  Enum['dsv', 'tss'] $mode = 'dsv',
  Boolean $metadata = false,
  String $storage_name = 'test-secret.txt',

) {}
