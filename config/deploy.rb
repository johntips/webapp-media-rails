# config valid only for Capistrano 3.1

set :application, "webapp-tabimuse-rails"
set :repo_url, 'https://github.com/teiyuueki/webapp-tabimuse-rails.git' #gitからコードをcloneする
set :branch, 'master' #マージ前なら他のブランチでも設定可能
set :deploy_to, '/var/www/html/webapp-tabimuse-rails'
set :log_level, :debug
set :keep_releases, 5 #接続を確保して同時接続を高速化するための設定。アクセス数に応じて変える必要あり
set :rbenv_type, :user
set :pty, true
set :rbenv_ruby, '2.2.0' #rubyのバージョン間違えないように!
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app),in: :sequence, wait:5 do
    # Your restart mechanism here, for example:
    execute :touch, release_path.join('tmp/restart.txt')
  end
end

  after :restart, :clear_cache do
    on roles(:web),in: :groups, limit:3, wait:10 do
    # Here we can do anything such as:
    # within release_path do
    #   execute :rake, 'cache:clear'
    # end
    end
  end
  after :finishing, 'deploy:cleanup'

end

