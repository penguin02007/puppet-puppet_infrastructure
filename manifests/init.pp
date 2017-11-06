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
  class{'puppet_infrastructure::config':}
  class{'puppet_infrastructure::puppet_mgmt_scripts':}
  class{'puppet_infrastructure::puppetdb_server':}
  class{'puppet_infrastructure::puppetserver_connect_puppetdb':}
  class{'puppet_infrastructure::puppetboard_server':}
  class{'puppet_infrastructure::puppetexplorer_vhost':}

  contain 'puppet_infrastructure::puppetserver_master'
  contain 'puppet_infrastructure::config'
  contain 'puppet_infrastructure::puppetdb_server'
  contain 'puppet_infrastructure::puppet_mgmt_scripts'
#  contain 'puppet_infrastructure::os_gems'
  contain 'puppet_infrastructure::puppetboard_server'
  contain 'puppet_infrastructure::puppetserver_connect_puppetdb'
  contain 'puppet_infrastructure::puppetexplorer_vhost'

  Class['puppet_infrastructure::puppetserver_master']
  -> Class['puppet_infrastructure::config']
    -> Class['puppet_infrastructure::puppet_mgmt_scripts']
      -> Class['puppet_infrastructure::puppetdb_server']
          -> Class['puppet_infrastructure::puppetboard_server']
            -> Class['puppet_infrastructure::puppetexplorer_vhost']
              -> Class['puppet_infrastructure::puppetserver_connect_puppetdb']
}
