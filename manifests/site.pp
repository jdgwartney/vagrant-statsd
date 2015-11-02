# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

exec { 'install-python':
  command => '/vagrant/install-python27.sh',
}
sudo apt-get tcl8.4-dev -y

$packages = [ "git", "stress", "sysstat", "python-software-properties", "nodejs", "npm", "memcached", "python-dev" "python-pip", "sqllite3", "libcairo2", "libcairo2-dev", "python-cairo", "pkg-config", "tcl8.4-dev"]
package { $packages:
  ensure => "installed"
  require => Exec["install-python"]
}

file { 'bash_profile':
  path    => '/home/vagrant/.bash_profile',
  ensure  => file,
  source  => '/vagrant/manifests/bash_profile',
  require => Class['boundary'],
}


exec { 'update-packages':
  command => '/usr/bin/apt-get update -y',
}

class { 'boundary':
  token => $api_token,
  require => Exec['update-packages'],
}
