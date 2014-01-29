#
# Cookbook Name:: prepare-env
# Recipe:: mlocate
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

package "mlocate" do
    action :install
end

bash "updatedb" do
    user "root"
    code <<-EOS
        updatedb
    EOS
end
