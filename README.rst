puppet-couchbase: Self scaling couchbase module
===============================================

This module can install couchbase on servers, create buckets
and automatically maintain the cluster.

Usage
-----

Install a new couchbase server with peers::

    class {"couchbase":
        size => 1024, 
        user=> 'couchbase', 
        password => 'password',
        version => latest, 
        peers => [{'ipaddress' => '167.3.3.3'}, {'ipaddress' => '12.4.4.4'}]
    }

Create a couchbase bucket::

    couchbase::bucket {"memcached":
        port => 11211,
        size => 1024,
        user => 'couchbase',
        password => 'password',
        type => 'memcached',
        replica=1
    }

Example
-------

::

    class {"couchbase":
        size => 2000,
        peers => servers_with_role('couchbase')
    } ->

    # needed to remove the machine from the cluster when
    # destroying the machine.
    class {"couchbase::cleanup":}

    couchbase::bucket {"authcache":
        port => 13000,
        size => 500,
        replica => 2
    }

    couchbase::bucket {"uploadcache":
        port => 15000,
        size => 500,
        replica => 2
    }

    couchbase::bucket {"querywbcache":
        port => 14000,
        size => 500,
        replica => 2
    }

    couchbase::bucket {"querydyncache":
        port => 14001,
        size => 500,
        replica => 2
    }
