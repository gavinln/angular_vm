# install mongodb
class mongodb_install {
    class { '::mongodb::server':
        verbose => true,
    }
}
