# install mongodb
class mongodb_install {
    class { '::mongodb::server':
        verbose => true,
        bind_ip => ['0.0.0.0'],
        rest => true,
    }
}
