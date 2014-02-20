#
# Cookbook Name:: prepare-env
# Recipe:: chef-solr-prepare
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::chef-solr'

solr_data_dir = node[:solr][:data_dir]
solr_core_dir = "#{Chef::Config[:file_cache_path]}/cores"
new_core_dirs = Dir.entries(solr_core_dir).grep(/\A[a-zA-Z0-9]+[a-zA-Z0-9.]+\z/)

git solr_core_dir do
    repository node[:solr][:core][:repo]
    action :sync
end

ruby_block "copy core settings from repository" do
    block do
        new_core_dirs.each do |d|
            FileUtils.copy_entry("#{solr_data_dir}/collection1", "#{solr_data_dir}/#{d}")
            FileUtils.copy_entry("#{solr_core_dir}/#{d}/", "#{solr_data_dir}/#{d}/")
        end
    end
end

ruby_block "create cores" do
    block do
        new_core_dirs.each do |d|
            p `curl "http://localhost:#{node[:solr][:port]}/solr/admin/cores?action=CREATE&name=#{d}"`
        end
    end
    notifies :restart, "service[solr]", :immediately
end

ruby_block "install core's data" do
    block do
        `sleep 10s`
        new_core_dirs.each do |d|
            `cd "#{solr_core_dir}/#{d}/schema" && curl "http://localhost:#{node[:solr][:port]}/solr/#{d}/update/json?commit=true" --data-binary @#{d}.json -H 'Content-type:application/json'`
        end
    end
    only_if do
        /(yes|^y|true|^t)/i =~ node[:solr][:core][:default][:delete]
    end
    notifies :restart, "service[solr]", :immediately
end

ruby_block "delete default core 'collection1'" do
    block do
        `sleep 10s`
        `curl "http://localhost:#{node[:solr][:port]}/solr/admin/cores?action=UNLOAD&name=collection1&deleteIndex=#{node[:solr][:core][:default][:delete_index]}&deleteDataDir=#{node[:solr][:core][:default][:delete_data_dir]}&deleteInstanceDir=#{node[:solr][:core][:default][:delete_instance_dir]}"`
    end
    only_if do
        /(yes|^y|true|^t)/i =~ node[:solr][:core][:default][:delete]
    end
    notifies :restart, "service[solr]", :immediately
end
