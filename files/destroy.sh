#!/bin/bash
apt-get --purge autoremove puppet-agent puppet5-release puppetexplorer -y
yes |gem uninstall r10k 
yes |gem uninstall hiera-eyaml
rm -rf /etc/puppetlabs
rm -rf /opt/puppetlabs
rm -rf /usr/share/puppetexplorer
