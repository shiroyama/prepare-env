#
# Cookbook Name:: prepare-env
# Recipe:: rbenv
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

rbenv_ruby node[:rbenv][:version] do
    ruby_version node[:rbenv][:version]
    global true
end
