# Class: puppetdoc
#
# Description
#  This module is designed to programatically generate PuppetDoc documentation
#  on a scheduled basis in order to assist in documentation efforts.   
#
# Parameters:
#   - $puppetmaster: This is the vhost that will be setup for hosting.
#   - $pc_docroot: the document root for apache vhost
#   - $pc_puppetdoc: the executable which will generate the code (normally puppet doc)
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
  $puppetmaster,
  $pc_docroot   = $puppetdoc::params::pc_docroot,
  $pc_puppetdoc = $puppetdoc::params::pc_puppetdoc,
) inherits puppetdoc::params {

  apache::vhost { $puppetmaster:
    port     => '80',
    docroot  => $pc_docroot,
    ssl      => false,
    priority => '50',
  }

  file { $pc_docroot:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  cron { 'update-puppetdoc':
    command => "${pc_puppetdoc} --all --mode rdoc --outputdir ${pc_docroot}/puppetdoc",
    user    => 'root',
    minute  => '22',
  }
}
