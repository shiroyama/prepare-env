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

unicorn は各 Rails アプリケーションの Gemfile に書くだろうと想定してここではインストールしていないが、nginx の設定で upstream の unicorn と接続する設定を定義してあるので `default["rails"]["server"]["socket"]` あたりの attribute は注意する必要がある。

初期状態で実行されるレシピは nodes/rails.json を参照のこと。適宜変更されたい。

# Requirements

ホスト機で bundle, vagrant が利用可能であること

# Usage

    $ bundle --path vendor/bundle
    $ bundle exec berks install # ~/.berkshelf にインストールされる
    $ vagrant ssh-config rails --host rails >> ~/.ssh/config
    $ vagrant up rails
    $ bundle exec knife solo prepare rails
    $ bundle exec knife solo cook rails
    $ vagrant ssh (or ssh rails)

※ 元は `berkes install --path ./cookbooks` にしていたのだが、何か遅いのでシステムグローバルな .berkshelf 以下に cookbooks をダウンロードするように変更した。  
意味ないかも知れん。自信ない。

# Attributes

`$ cat ./attributes/rails.rb`

# Recipes

`$ tree ./recipes/`

# Author

Author:: Fumihiko Shiroyama (<fu.shiroyama@gmail.com>)
