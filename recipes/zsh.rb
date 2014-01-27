#
# Cookbook Name:: prepare-env
# Recipe:: zsh
# Author:: Fumihiko Shiroyama<fu.shiroyama@gmail.com>
#
# Copyright (C) 2014 Fumihiko Shiroyama
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

include_recipe 'prepare-env::yum-repos'

package "zsh" do
    action :install
end

bash "chsh" do
    code <<-EOS
        chsh -s `which zsh` #{node[:zsh][:user]}
    EOS
    only_if do
        /(yes|^y)/i =~ node[:zsh][:chsh]
    end
end
