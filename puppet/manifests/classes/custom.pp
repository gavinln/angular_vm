# miscellaneous software
#
class custom {
    class {
        apt:;
        googlechrome: require => Class[apt];
        xvfb: require => Class[apt];
    }
}
