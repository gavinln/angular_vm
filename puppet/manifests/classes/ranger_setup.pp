# Commands to setup the ranger terminal file manager
# https://www.digitalocean.com/community/tutorials/installing-and-using-ranger-a-terminal-file-manager-on-a-ubuntu-vps
class ranger_setup {
    case $operatingsystem {
        ubuntu: {
            $misc_packages = [
                'ranger',  # terminal file manager
                'caca-utils',  # graphics library that outputs text
                'highlight',  # highlight sourcecode terminal or other formats
                'atool',  # manager archives such as tar, zip
                'w3m',  # text based browser (no javascript support)
                'poppler-utils',  # pdf viewer
                'mediainfo'  # info about audio/video/image files
            ]
            package { $misc_packages:
                ensure => present,
                require => Exec['update_apt'];
            }
        }
    }
}
