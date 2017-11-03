# puppet_infrastructure
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_infrastructure
class puppet_infrastructure{

  class{'puppet_infrastructure::puppetserver_master':}
  class{'puppet_infrastructure::puppetsdb_server':}
  class{'puppet_infrastructure::puppets_mgmt_scripts':}

  contain 'puppet_infrastructure::puppetserver_master'
  contain 'puppet_infrastructure::puppetdb_server'
  contain 'puppet_infrastructure::puppet_mgmt_scripts'
  contain 'puppet_infrastructure::os_gems'
  Class['puppet_infrstructure::puppetserver_master']
  -> Class['puppet_infrastructure::config']
    -> Class['puppet_infrastructure::puppetdb_server']
      -> Class['puppet_infrastructure::puppet_mgmt_scripts']
}
