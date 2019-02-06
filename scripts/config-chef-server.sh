#!/bin/bash

set -x

# Copy chef-server.rb if not exist or empty
if [[( ! -f /etc/opscode/chef-server.rb ) || (! -s /etc/opscode/chef-server.rb)]]; then
    cp /chef-server.rb /etc/opscode/chef-server.rb
fi