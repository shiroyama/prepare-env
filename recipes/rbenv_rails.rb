#
# Cookbook Name:: prepare-env
# Recipe:: rbenv_rails
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::rbenv'

ruby_block "resolv.conf" do
    # TODO enable only CentOS
    block do
        resolver = "/etc/resolv.conf"
        File.open(resolver, "r+") {|f|
            option = "options single-request-reopen"
            f.puts(option) unless f.readlines.any? {|l|
                /#{option}/ =~ l
            }
        }
    end
    only_if do platform?("centos") end
end

rbenv_gem "rails" do
    ruby_version "2.0.0-p353"
end
