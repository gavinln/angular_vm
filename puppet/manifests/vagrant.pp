#
# puppet magic for dev boxes
#
import "classes/*.pp"

$PROJ_DIR = "/vagrant"
$HOME_DIR = "/home/vagrant"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class dev {
    class {
        init:;
        javascript: require => Class[init];
        mongodb_install: require => Class[init];

        apt: require => Class[init];
        googlechrome: require => Class[apt];
    }
}

include dev

