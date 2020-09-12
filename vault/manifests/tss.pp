# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include vault::tss
class vault::tss(
  $user       = $::vault::tssparams::user,
  $password   = $::vault::tssparams::password
) inherits ::vault::tssparams { 
  file { '/tmp/jptest2': 
    content => 'meowmeow'
  }
}

