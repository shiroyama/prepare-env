#
# Cookbook Name:: prepare-env
# Recipe:: solr
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::openjdk'

file_name  = "solr-#{node[:solr][:version]}.#{node[:solr][:file_type]}"
remote_url = "#{node[:solr][:repo_url]}/#{node[:solr][:version]}/#{file_name}"
cache_path = "#{Chef::Config['file_cache_path']}/#{file_name}"
#cache_path = "/tmp/#{file_name}"

remote_file cache_path do
  action :create_if_missing
  source remote_url
  path   cache_path
  mode   00644
end

default_user = data_bag_item("users", "default")

directory node[:solr][:solr_home] do
  user default_user["name"]
  group default_user["name"]
  action :create
end

case node[:solr][:file_type]
when "tgz"
  execute "solr tar install" do
    command <<-EOS
      tar -xvzf #{cache_path} -C #{node[:solr][:solr_home]}
    EOS
  end
else
  Chef::Log.debug("do nothing")
end
