#! /bin/sh

<% peers.each do |peer| -%>
/opt/couchbase/bin/couchbase-cli rebalance -c localhost -u <%= user %> -p <%= password %> --server-add=<%= peer['ipaddress'] %> --server-add-username=<%= user %> --server-add-password=<%= password %>
<% end -%>
