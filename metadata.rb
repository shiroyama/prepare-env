name             'prepare-env'
maintainer       'Fumihiko Shiroyama'
maintainer_email 'fu.shiroyama@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures prepare-env'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "yum"
depends "yum-epel"
depends "yum-repoforge"
depends "rbenv"
depends "vim"
depends "git"
depends "chef-solr"
