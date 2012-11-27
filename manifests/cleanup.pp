class couchbase::cleanup {
    file {"/usr/share/mcollective/plugins/mcollective/agent/cleaners/couchbase.rb":
        content => template('couchbase/couchbase.rb.erb'),
        owner => 'root',
        group => 'root',
        mode => '0644',
        ensure => present,
        replace => true,
        subscribe => Package['mcollective-plugins-cleanup'],
    }
}