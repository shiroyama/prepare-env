#
# Cookbook Name:: prepare-env
# Recipe:: nginx
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::yum-repos'

package "nginx" do
    action :install
end

service "nginx" do
    supports :status => true, :restart => true, :reload => true
    action [:enable, :start]
end
