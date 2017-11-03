# puppet_infrastructure::puppetserver_master
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_infrastructure::puppetserver_master
class puppet_infrastructure::puppetserver_master {

disable IPv6 due to causing problem with PUPPETDB not starting on IPv4
  sysctl { 'net.ipv6.conf.all.disable_ipv6': value => '1' }
  sysctl { 'net.ipv6.conf.default.disable_ipv6': value => '1' }
  sysctl { 'net.ipv6.conf.lo.disable_ipv6': value => '1' }
  # PuppetServer
  class { 'puppetserver::repository': } ->
  class { 'puppetserver':
#    config => {
#      'java_args' => {
#        'xms'         => '1g',
#        'xmx'         => '2g',
#        'maxpermsize' => '512m',
#        'tmpdir'      => '/tmp',
#      }
#    }
  } ->

  package {[
    'puppet-lint',
    'ruby-bundler',
    'vim-puppet',
    'ruby-dev',
    'cmake',
    'pkg-config',
  ]:
    ensure => latest,
  } ->

 package{"r10k.puppetserver_gem":
    name     => 'r10k',
    ensure   => latest,
    provider => puppetserver_gem,
  } ->

  # PuppetServer Path Ruby Gem Packages
  package {[
    'hiera-eyaml',
    'rspec-puppet',
    'CFPropertyList',
    'retries',
    'msgpack',
  ]:
    ensure => latest,
    provider =>  [
      'puppetserver_gem',
      'puppet_gem',
    ],
  }

}
