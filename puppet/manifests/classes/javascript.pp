class javascript {
    class { 'nodejs':
        version => 'v0.10.33'
    }
    package { 'bower':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
    package { 'grunt-cli':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
    package { 'karma-cli':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
    package { 'yo':
        provider => npm,
        require => Class['nodejs']
    }
    package { 'generator-angular':
        provider => npm,
        ensure => installed,
        require => Package['yo']
    }
    package { 'generator-gulp-angular':
        provider => npm,
        ensure => installed,
        require => Package['yo']
    }
    #exec { "npm_install":
    #    command => "npm install --no-bin-links",
    #    cwd => "/vagrant",
    #    path => "/usr/local/node/node-default/bin",
    #    require => Class['nodejs']
    #}
    #exec { "bower_install":
    #    command => "bower install",
    #    cwd => "/vagrant",
    #    path => "/usr/local/node/node-default/bin",
    #    require => Class['nodejs']
    #}
}
