class couchbase::config($size, $user, $password, $peers) {
    Class['couchbase::config'] -> class {"firstrun":}

    if $firstrun {
        exec {"couchbase-init":
            path => ['/opt/couchbase/bin', '/usr/bin/'],
            command => "couchbase-cli cluster-init -c localhost:8091 --cluster-init-username=$user --cluster-init-password=$password --cluster-init-port=8091 --cluster-init-ramsize=$size",
            require => Class['couchbase::install']
        }
        
        # let the other hosts know there is a new server in the pool.
        # but only do this on first run.
        notify {"kick -> couchbase":}
    }
    
    file {"/usr/local/bin/couchbase-cluster-setup.sh":
        mode => '0755',
        content => template('couchbase/couchbase-cluster-setup.sh'),
        ensure => present,
    }
    
    exec {"couchbase-cluster-setup":
        path => ["/usr/local/bin", '/usr/bin/', '/opt/couchbase/bin'],
        command => "couchbase-cluster-setup.sh",
        require => File['/usr/local/bin/couchbase-cluster-setup.sh'],
        returns => [0, 2]
    }
}