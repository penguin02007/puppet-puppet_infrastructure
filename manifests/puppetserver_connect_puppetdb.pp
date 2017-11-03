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
}
