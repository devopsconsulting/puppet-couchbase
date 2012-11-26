class couchbase::install($version) {
    package {"couchbase-server":
        ensure => $version
    }
}