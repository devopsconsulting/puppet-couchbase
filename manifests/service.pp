class couchbase::service {
    service {"couchbase-server":
        ensure => running,
        hasstatus => true,
        hasrestart => true
    }
}