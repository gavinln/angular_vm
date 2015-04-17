# miscellaneous software
#
class custom {
    class {
        apt:;
        ohmyzsh: require => Class[apt];
#        googlechrome: require => Class[apt];
#        xvfb: require => Class[apt];
    }
}
