#!/bin/bash

set -x

# Create chef-server.rb with variables
if [[ -z $ENABLE_NON_SSL ]]; then
    echo "nginx['enable_non_ssl']=false" >> /etc/opscode/chef-server.rb
    # sed "100anode.default['private_chef']['nginx']['enable_non_ssl']=false" /opt/opscode/embedded/cookbooks/private-chef/recipes/nginx.rb > /opt/opscode/embedded/cookbooks/private-chef/recipes/nginx.rb
else
    echo "nginx['enable_non_ssl']=$ENABLE_NON_SSL" >> /etc/opscode/chef-server.rb
    # sed "100anode.default['private_chef']['nginx']['enable_non_ssl']=$ENABLE_NON_SSL" /opt/opscode/embedded/cookbooks/private-chef/recipes/nginx.rb > /opt/opscode/embedded/cookbooks/private-chef/recipes/nginx.rb
fi

if [[ -z $SSL_PORT ]]; then
  echo "nginx['ssl_port']=443" >> /etc/opscode/chef-server.rb
else
  echo "nginx['ssl_port']=$SSL_PORT" >> /etc/opscode/chef-server.rb
fi