# puppet_infrastructure::os_gems
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_infrastructure::os_gems
class puppet_infrastructure::os_gems {

  # OS Provided Gems
  package{"r10k.${::operatingsystem}":
    ensure   => latest,
    name     => 'r10k',
    provider => gem,
  }

  package{"rspec-puppet.${::operatingsystem}":
    ensure   => latest,
    name     => 'rspec-puppet',
    provider => gem,
  }
  package{"hiera-eyaml.${::operatingsystem}":
    ensure   => latest,
    name     => 'hiera-eyaml',
    provider => gem,
  }
  package{"puppet-blacksmith.${::operatingsystem}":
    ensure   => latest,
    name     => 'puppet-blacksmith',
    provider => gem,
  }

  package{"CFPr::opertyList.${::operatingsystem}":
    ensure   => latest,
    name     => 'CFPr::opertyList',
    provider => gem,
  }
  package{"msgpack.${::operatingsystem}":
    ensure   => latest,
    name     => 'msgpack',
    provider => gem,
  }

  # octocatalog-diff
  # https://githubengineering.com/octocatalog-diff-github-s-puppet-development-and-testing-tool/
  package{'octocatalog-diff-local':
    ensure   => latest,
    name     => 'octocatalog-diff',
    provider => gem,
    require  => Package['ruby-dev','cmake','pkg-config'],
  }

}
