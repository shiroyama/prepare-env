#
# Cookbook Name:: prepare-env
# Recipe:: mkdir_tmp
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

default_user = data_bag_item("users", "default")

directory "#{default_user['home']}/tmp" do
    user default_user["name"]
    group default_user["name"]
    action :create
end
