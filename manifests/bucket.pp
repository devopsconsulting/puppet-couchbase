define couchbase::bucket($port, $size, $user='couchbase', $password='password', $type='memcached', $replica=1) {
    Class['couchbase'] -> Couchbase::Bucket[$title]
    
    exec {"bucket-create-$title":
        path => '/opt/couchbase/bin/',
        command => "couchbase-cli bucket-create -c localhost -u $user -p $password --bucket=$title --bucket-type=$type --bucket-ramsize=$size --bucket-port=$port --bucket-replica=$replica",
        returns => [0, 2]
    }
}