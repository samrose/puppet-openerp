class openerp::base($groups=['dialout','postgres','adm']) {

  user {'openerp':
    ensure     => present,
    shell      => '/bin/bash',
    home       => '/srv/openerp',
    managehome => true,
    groups     => $groups,
    require    => Package['postgresql']
  }

  file {'/srv/openerp/.ssh':
    ensure => directory,
    owner  => 'openerp',
    group  => 'openerp',
    mode   => '0755',
    require=> User['openerp'],
  }
}
