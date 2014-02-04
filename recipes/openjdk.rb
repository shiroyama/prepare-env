#
# Cookbook Name:: prepare-env
# Recipe:: openjdk
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::yum-repos'

package "java-#{node[:openjdk][:version]}-openjdk" do
    action :install
end
