# puppet_infrastructure::puppetboard_server
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_infrastructure::puppetboard_server
class puppet_infrastructure::puppetboard_server {

  # Apache Server Installation
  class { 'apache': }
  class { 'apache::mod::wsgi': }

  # PuppetBoard Web UI
  class { 'puppetboard':
    manage_git        => true,
    manage_virtualenv => true,
    enable_catalog    => true,
    enable_query      => true,
    reports_count     => '50',
  }
  # Apache Vhost for PuppetBoard Web UI
  class { 'puppetboard::apache::vhost':
    vhost_name => "puppetboard.${::domain}",
    port       => 80,
  }

}
