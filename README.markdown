# PuppetDoc Module

James Fryman <james@frymanet.com>

This module sets up an Apache VHost with generated puppetdocs from your puppetmaster.

http://projects.puppetlabs.com/projects/1/wiki/Puppet_Manifest_Documentation

# Quick Start

Install and bootstrap an Apache instance with puppetdoc root.

# Requirements
_Puppet Labs Standard Library_
- http://github.com/puppetlabs/puppetlabs-stdlib

_Apache Module_
- http://github.com/puppetlabs/puppetlabs-apache

*Setup the Apache with vhost.*
<pre>
   class { 'puppetdoc':
    puppetmaster => 'puppet.frymanet.com',
  }
</pre>

