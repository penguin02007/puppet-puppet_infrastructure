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
  package{"r10k.${operatingsystem}":
    name     => 'r10k',
    ensure   => latest,
    provider => gem,
  }

  package{"rspec-puppet.${operatingsystem}":
    name     => 'rspec-puppet',
    ensure   => latest,
    provider => gem,
  }
  package{"hiera-eyaml.${operatingsystem}":
    name     => 'hiera-eyaml',
    ensure   => latest,
    provider => gem,
  }
  package{"puppet-blacksmith.${operatingsystem}":
    name     => 'puppet-blacksmith',
    ensure   => latest,
    provider => gem,
  }

  package{"CFPropertyList.${operatingsystem}":
    name     => 'CFPropertyList',
    ensure   => latest,
    provider => gem,
  }
  package{"msgpack.${operatingsystem}":
    name     => 'msgpack',
    ensure   => latest,
    provider => gem,
  }

  # octocatalog-diff
  # https://githubengineering.com/octocatalog-diff-github-s-puppet-development-and-testing-tool/
  package{'octocatalog-diff-local':
    name     => 'octocatalog-diff',
    ensure   => latest,
    provider => gem,
    require  => Package['ruby-dev','cmake','pkg-config'],
  }

}
