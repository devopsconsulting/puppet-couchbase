class couchbase::service {
    service {"couchbase-server":
        ensure => running,
        has_status => true,
        has_restart => true
    }
}