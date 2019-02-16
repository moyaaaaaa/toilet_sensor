set :application, 'toilet_sensor'

set :repo_url, 'git@github.com:moyaaaaaa/toilet_sensor.git'

# デプロイするブランチを指定
set :branch, 'master'

# デプロイ先のディレクトリ
set :deploy_to, '/var/www/toilet_sensor'

# 保持するバージョンの数
set :keep_releases, 5

# rubyのバージョン
set :rbenv_ruby, '2.3.1'

# rbenvのパス指定
set :rbenv_path, '$HOME/.rbenv'

# ログレベルの指定
set :log_level, :debug

namespace :deploy do

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
