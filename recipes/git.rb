#
# Cookbook Name:: prepare-env
# Recipe:: git
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'git::source'

package "git" do
    action :remove
end

file "/etc/profile.d/git.sh" do
    owner "root"
    group "root"
    mode "644"
    action :create
    content <<-EOS
        alias git=#{node[:git][:prefix]}/bin/git
    EOS
end
