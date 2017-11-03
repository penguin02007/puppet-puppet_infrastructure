# puppet_infrastructure::puppetdb_server
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_infrastructure::puppetdb_server
class puppet_infrastructure::puppetdb_server {

  class { 'puppetdb':
    listen_address => '0.0.0.0',
    node_ttl       => '2d',
    node_purge_ttl => '3d',
    report_ttl     => '3d',
    java_args      => {
      '-Xmx' => '1g',
    }
  }
}
