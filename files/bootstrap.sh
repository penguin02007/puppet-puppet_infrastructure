#!/bin/bash
release_name=`lsb_release -c | awk '{print $2}'`
release_number=`lsb_release -r | awk '{print $2}'| tr -d '.'`

echo '*** Attempting to install the puppet5 release apt repository from apt.puppet.com first ***'
puppet_package='puppet-agent'; wget http://apt.puppet.com/puppet5-release-$release_name.deb; dpkg -i puppet5-release-$release_name.deb
if [ $? $test -eq 1 ]; then
   echo "*** Could not find puppet5-release for $release_name.  Trying puppetlabs-release-pc1 as alternative. ***"
   puppet_package='puppet-agent'; wget http://apt.puppet.com/puppetlabs-release-pc1-$release_name.deb; dpkg -i puppetlabs-release-pc1-$release_name.deb
   if [ $? $test -eq 1 ]; then
      echo "*** Could not find puppetlabs pc1 release for $release_name.  Trying puppetlabs-release alternative. ***"
      puppet_package='puppet'; wget http://apt.puppet.com/puppetlabs-release-$release_name.deb; dpkg -i puppetlabs-release-$release_name.deb
      if [ $? $test -eq 1 ]; then
         echo "Could not find puppetlabs-release for $release_name.  Trying puppetlabs-release-precise as alternative."
         puppet_package='puppet'; wget http://apt.puppet.com/puppetlabs-release-precise.deb; dpkg -i puppetlabs-release-precise.deb
      fi
   fi
fi

echo '### UPDATING AND INSTALLING NECESSARY PACKAGES ###'
echo '*** PUPPET_PACKAGE:' $puppet_package '***'
apt-get update -y && apt-get install -y ruby ruby-dev $puppet_package


echo "### INSTALLING R10K and Hierra-eyaml ###"
gem install r10k hiera-eyaml
cd /etc/puppetlabs/code && wget https://raw.githubusercontent.com/ppouliot/puppet-puppet_infrastructure/master/Puppetfile
/usr/local/bin/r10k puppetfile install --verbose DEBUG2
/opt/puppetlabs/bin/puppet apply --debug -trace --verbose --modulepath=/etc/puppetlabs/code/modules /etc/puppetlabs/code/modules/puppet_infrasturcture/examples/init.pp
