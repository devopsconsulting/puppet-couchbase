class couchbase($size=1024, $user='couchbase', $password='pasword', $version=latest, $peers=[]) {
    
    class {"couchbase::install":
        version => $version
    }
    
    class {"couchbase::config":
        size => $size,
        user => $user,
        password => $password,
        peers => $peers
    }
    
    include couchbase::service
    
    Class['couchbase::install'] -> Class['couchbase::config'] -> Class['couchbase::service']
}