# puppet_infrastructure::puppet_mgmt_scripts
#
# Useful managment scripts 
#
# @summary Puts useful puppet infra management scripts in /root/bin
#
# @example
#   include puppet_infrastructure::puppet_mgmt_scripts
class puppet_infrastructure::puppet_mgmt_scripts {
 file{'/root/bin':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0770',
  } ->
  file{'/root/bin/stop_puppetdb_services.sh':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0770',
    content => "# This Script is Managed by in the
#Puppet Node Definition for ${fqdn}
#!/bin/bash
puppet resource service puppet ensure=stopped
puppet resource service puppetdb ensure=stopped
puppet resource service postgresql ensure=stopped
puppet resource service mcollective ensure=stopped
",
  } ->
  file{'/root/bin/start_puppetdb_services.sh':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0770',
    content => "# This Script is Managed by in the
#Puppet Node Definition for ${fqdn}
#!/bin/bash
puppet resource service puppet ensure=running
puppet resource service puppetdb ensure=running
puppet resource service postgresql ensure=running
puppet resource service mcollective ensure=running
",
  }

}
