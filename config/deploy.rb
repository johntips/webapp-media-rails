lock '3.2.1'

set :application, 'webapp-tabimuse-rails'
set :repo_url, 'https://github.com/teiyuueki/webapp-tabimuse-rails.git'
set :branch, 'master'
set :deploy_to, '/var/www/html/webapp-tabimuse-rails'
set :scm, :git
set :log_level, :debug
set :pty, true
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end