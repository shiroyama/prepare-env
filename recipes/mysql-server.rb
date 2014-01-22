#
# Cookbook Name:: prepare-env
# Recipe:: mysql-server
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::yum-repos'

# mysql-devel is necessary for "rails -d mysql"
%w{mysql-server mysql-devel}.each do |pkg|
    package pkg do
        action :install
    end
end

service "mysqld" do
    supports :status => true, :restart => true, :reload => true
    action [:enable, :start]
end
