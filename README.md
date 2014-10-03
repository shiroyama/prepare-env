# prepare-env cookbook

Vagrant 上に Rails の開発環境をひと通り揃えるための cookbook

role が2つ定義されており `role[prepare]` では

* zsh
* screen
* vim
* homesick

をインストールする。

homesick の設定を変えるために `default['homesick']['repo']` をあなたの dotfiles のリポジトリに変更する必要がある。

`role[rails]` では

* rbenv
* bundler
* rails
* nginx
* mysql-server

をインストールする。

Ruby のバージョンは `default["rbenv"]["version"] = "2.0.0-p353"` で変更する。

unicorn は各 Rails アプリケーションの Gemfile に書くだろうと想定してここではインストールしていないが、nginx の設定で upstream の unicorn と接続する設定を定義してあるので `default["rails"]["server"]["socket"]` あたりの attribute は注意する必要がある。

初期状態で実行されるレシピは nodes/rails.json を参照のこと。適宜変更されたい。

# Requirements

ホスト機で bundle, vagrant, VirtualBox が利用可能であること

* `gem install bundler`
* install [Vagrant](https://www.vagrantup.com/downloads.html "Vagrant")
* install [VirtualBox](https://www.virtualbox.org/wiki/Downloads "VirtualBox")

# Usage

    % bundle --path vendor/bundle
    % berkes vendor ./cookbooks
    % vagrant up rails
    % bundle exec knife solo prepare rails
    % bundle exec knife solo cook rails --no-berkshelf
    % vagrant ssh-config rails --host rails >> ~/.ssh/config
    % vagrant ssh (or ssh rails)

    # リモートで
    % rails new hello_rails --skip-bundle
    % cd ./hello_rails
    % cat<<'EOS'>>Gemfile
      gem 'therubyracer',  platforms: :ruby
      EOS
    % bundle --path vendor/bundle
    % bundle exec rails s
    % sudo service iptables stop

    http://localhost:3000/ or http://33.33.33.100:3000/ で Rails のトップ画面に接続できたら成功  
    nginx + unicorn 等は各自ご自由にどうぞ

# Attributes

`$ cat ./attributes/rails.rb`

# Recipes

`$ tree ./recipes/`

# Author

Author:: Fumihiko Shiroyama (<fu.shiroyama@gmail.com>)
