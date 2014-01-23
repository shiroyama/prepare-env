#
# Cookbook Name:: prepare-env
# Recipe:: screen
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::yum-repos'

package "screen" do
    action :install
end
