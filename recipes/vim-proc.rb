#
# Cookbook Name:: prepare-env
# Recipe:: vim-proc
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::vim-neobundle'

default_user = data_bag_item("users", "default")

execute "compile vimproc" do
    command "su #{default_user["name"]} -l -c \"cd #{default_user['home']}/.bundle/vimproc && make 1>/dev/null 2>&1\""
    only_if do
        /(yes|^y)/i =~ node[:vim][:vimproc][:compile]
    end
end
