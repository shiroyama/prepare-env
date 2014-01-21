#
# Cookbook Name:: prepare-env
# Recipe:: nginx-rails
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::nginx'

template "/etc/nginx/conf.d/default.conf" do
    source "nginx-rails/default.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :reload, 'service[nginx]'
end
