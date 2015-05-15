class javascript {
    class { 'nodejs':
        version => 'v0.10.33'
    }
    package { 'bower':
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
        ensure => installed,
        require => Class['nodejs']
    }
    package { 'gulp':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
    package { 'generator-gulp-angular':
        provider => npm,
        ensure => installed,
        require => Package['yo']
    }
    package { 'protractor':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
    exec { "webdriver-manager_update":
        command => "/usr/local/node/node-default/bin/webdriver-manager update",
        path => "/usr/local/node/node-default/bin",
        require => Class['nodejs']
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
