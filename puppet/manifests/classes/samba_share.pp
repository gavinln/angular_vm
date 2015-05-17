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
        netbios_name         => 'test',
        interfaces           => [ 'lo', 'eth0' ],
        # comment out next line to allow all access to samba share
        hosts_allow          => [ '127.', '192.168.' ],
        local_master         => 'yes',
        map_to_guest         => 'Bad User',
        os_level             => '50',
        preferred_master     => 'yes',
        extra_global_options => [
            'printing = BSD',
            'printcap name = /dev/null',
            'create mask = 0777',
            'directory mask = 2777',
        ],
        shares => {
            'share' => [
                'comment = Shared Folder',
                'path = /srv/share',
                'browseable = yes',
                'writable = yes',
                'guest ok = yes',
                'force user = vagrant',
                'force group = vagrant',
                'available = yes',
# Need to add the following otherwise get the error on somem systems
# "Oplock break failed for file" in /var/log/samba
                'oplocks = False',
                'level2 oplocks = False'
            ],
        },
        selinux_enable_home_dirs => true,
    }
}
