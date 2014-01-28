# prepare-env cookbook

Vagrant 上に Rails の開発環境をひと通り揃えるための cookbook

# Requirements

ホスト機で bundle, vagrant が利用可能であること

# Usage

$ bundle --path vendor/bundle

$ bundle exec berks --path cookbooks

$ bundle exec knife solo prepare default

$ bundle exec knife solo cook default

$ vagrant ssh

おいっしいのう！

# Attributes

$ cat ./attributes/default.rb

# Recipes

$ tree ./recipes/

# Author

Author:: Fumihiko Shiroyama (<fu.shiroyama@gmail.com>)
