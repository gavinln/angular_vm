# Setup samba shares
class samba_share {
    file { "/srv/share":
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => 777,
    }
    class {'::samba::server':
        workgroup            => 'WORKGROUP',
        server_string        => 'Example File Server 01',
        netbios_name         => 'IPython',
        interfaces           => [ 'lo', 'eth0' ],
        hosts_allow          => [ '127.', '192.168.' ],
        local_master         => 'yes',
        map_to_guest         => 'Bad User',
        os_level             => '50',
        preferred_master     => 'yes',
        extra_global_options => [
            'printing = BSD',
            'printcap name = /dev/null',
        ],
        shares => {
            'share' => [
                'comment = Shared Folder',
                'path = /srv/share',
                'browseable = yes',
                'writable = yes',
                'guest ok = yes',
                'available = yes',
            ],
        },
        selinux_enable_home_dirs => true,
    }
}
