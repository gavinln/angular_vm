# miscellaneous software
#
class custom {
    class {
        apt: require => Class[init];
        googlechrome: require => Class[apt];
    }
}
