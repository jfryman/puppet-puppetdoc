# Class: puppetdoc
#
# Description
#  This module is designed to programatically generate PuppetDoc documentation
#  on a scheduled basis in order to assist in documentation efforts.   
#
# Parameters:
#   - $puppetmaster: This is the vhost that will be setup for hosting.
#
# Actions:
#   This module configures an Apache vhost, and setups a reoccuring cron job to automatically generate
#   puppetdoc output.
#
# Requires:
#   - Class[apache] - used to setup a vhost
#   - puppetdoc - used to generate documentation
#
# Sample Usage:
#   class { 'puppetdoc': 
#     puppetmaster => 'puppetmaster.test.com',  
#   }

class puppetdoc(
  $puppetmaster    
) {
  include puppetdoc::params

  apache::vhost { $puppetmaster: 
    port     => '80',
    docroot  => $puppetdoc::params::pc_docroot,
    ssl      => 'false',
    priority => '50',
  }

  file { $puppetdoc::params::pc_docroot:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
   
  cron { 'update-puppetdoc': 
    command => "${puppetdoc::params::pc_puppetdoc} --all --mode rdoc --outputdir $puppetdoc::params::pc_docroot/puppetdoc",
    user    => 'root',
    minute  => '22',
  }
}
