# Class: puppetdoc::params
#
# Description
#   This class is designed to carry default parameters for 
#   Class: puppetdoc.  
#
# Parameters:
#   $pc_docroot - The root document where an Apache vhost will be serving files form.
#   $pc_puppetdoc - The default location to the puppetdoc executable on the system (if not in path)
#
# Actions:
#   This module does not perform any actions.
#
# Requires:
#   This module has no requirements.   
#
# Sample Usage:
#   This method should not be called directly.
class puppetdoc::params {
  $pc_docroot   = '/opt/puppet/www'
  $pc_puppetdoc = '/opt/puppet/bin/puppetdoc'
}
