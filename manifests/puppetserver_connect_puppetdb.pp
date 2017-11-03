# puppet_infrastructure::puppetserver_connect_puppetdb
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_infrastructure::puppetserver_connect_puppetdb
class puppet_infrastructure::puppetserver_connect_puppetdb {
  class { 'puppetdb::master::config':}
->ini_setting{'reports-puppetdb':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'reports',
    value   => 'puppetdb',
  }
}
