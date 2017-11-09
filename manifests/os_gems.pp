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
    ensure   => absent,
    name     => 'r10k',
    provider => gem,
  }

  package{"rspec-puppet.${::operatingsystem}":
    ensure   => absent,
    name     => 'rspec-puppet',
    provider => gem,
  }
  package{"hiera-eyaml.${::operatingsystem}":
    ensure   => absent,
    name     => 'hiera-eyaml',
    provider => gem,
  }
  package{"puppet-blacksmith.${::operatingsystem}":
    ensure   => absent,
    name     => 'puppet-blacksmith',
    provider => gem,
  }

  package{"CFPropertyList.${::operatingsystem}":
    ensure   => absent,
    name     => 'CFPropertyList',
    provider => gem,
  }
  package{"msgpack.${::operatingsystem}":
    ensure   => absent,
    name     => 'msgpack',
    provider => gem,
  }

  # octocatalog-diff
  # https://githubengineering.com/octocatalog-diff-github-s-puppet-development-and-testing-tool/
  package{'octocatalog-diff-local':
    ensure   => absent,
    name     => 'octocatalog-diff',
    provider => gem,
    require  => Package['ruby-dev','cmake','pkg-config'],
  }

}
