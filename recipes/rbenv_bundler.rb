#
# Cookbook Name:: prepare-env
# Recipe:: rbenv_bundler
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::rbenv'

rbenv_gem "bundler" do
    ruby_version node[:rbenv][:version]
end
