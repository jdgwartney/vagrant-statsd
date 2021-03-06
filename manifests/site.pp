# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

exec { 'update-packages':
  command => '/usr/bin/apt-get update -y',
}

exec { 'install-python':
  command => "/vagrant/install-python27.sh",
  require => File["bash_profile"],
}

Package {
  ensure => "installed",
  require => Exec["update-packages"],
  before => Exec["install-python"],
}

package { "git": }
package { "stress": }
package { "sysstat": }
package { "nodejs":}
package { "npm": }
package { "memcached": }
package { "python-dev": }
package { "python-pip": }
package { "sqlite3": }
package { "libcairo2": }
package { "libcairo2-dev": }
package { "python-cairo": }
package { "pkg-config": }
package { "tcl8.4-dev": }

file { 'bash_profile':
  path    => '/home/vagrant/.bash_profile',
  ensure  => file,
  source  => '/vagrant/manifests/bash_profile',
  require => Class['boundary'],
}



class { 'boundary':
  token => $api_token,
  require => Exec['update-packages'],
}
