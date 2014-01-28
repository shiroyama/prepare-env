#
# Cookbook Name:: prepare-env
# Recipe:: rbenv_homesick
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::rbenv'
include_recipe 'prepare-env::git'

rbenv_gem "homesick" do
    ruby_version node[:rbenv][:version]
end

rbenv_path = "#{node[:rbenv][:root_path]}/shims"

bash "homesick" do
    user node[:homesick][:user]
    environment "HOME" => "/home/#{node[:homesick][:user]}"

    code <<-EOS
        #{rbenv_path}/homesick clone #{node[:homesick][:repo]}
        #{rbenv_path}/homesick symlink #{node[:homesick][:castle]}
    EOS
end
