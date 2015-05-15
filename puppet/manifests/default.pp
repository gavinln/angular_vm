#
# puppet magic for dev boxes
#
import "classes/*.pp"

$PROJ_DIR = "/vagrant"
$HOME_DIR = "/home/vagrant"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

node 'vm' {
    class {
        init:;
        ohmyzsh_setup:;
        javascript: require => Class[init];
        java_setup: require => Class[init];
        samba_share: require => Class[init];
        display: require => Class[init];
        google_chrome: require => Class[init];
        docker:
            version => '1.6.0',
            tcp_bind    => 'tcp://0.0.0.0:2375',
            socket_bind => 'unix:///var/run/docker.sock';
#        custom: require => Class[init];
    }
}

node 'clone' {

}
