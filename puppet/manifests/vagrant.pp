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
        ohmyzsh_setup:;
        javascript: require => Class[init];
        samba_share: require => Class[init];
#        custom: require => Class[init];
    }
}

include dev

