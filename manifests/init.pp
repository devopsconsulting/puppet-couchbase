class couchbase($size=1024, $user='couchbase', $password='password', $version=latest, $peers=[]) {
    
    class {"couchbase::install":
        version => $version
        } ->
    
    class {"couchbase::config":
        size => $size,
        user => $user,
        password => $password,
        peers => $peers
        } ->
    
    class {"couchbase::service":}
}