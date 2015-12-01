require 'capistrano/setup'
require 'capistrano/deploy'

# rbenvを使用している場合
require 'capistrano/rbenv'

# デプロイ先のサーバで、ユーザディレクトリでrbenvをインストールしている場合
set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'

require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

require 'capistrano3/unicorn'

# Rails4から分離したsecrets.ymlの環境変数を .envファイルで管理する
# set :linked_files, %w{config/secrets.yml .env}

# タスクを読み込むけど、今回は特に使わない
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }