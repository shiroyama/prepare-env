#
# Cookbook Name:: prepare-env
# Recipe:: image_magick
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::yum-repos'

%w{ImageMagick ImageMagick-devel}.each do |pkg|
  package pkg do
    action :install
  end
end
