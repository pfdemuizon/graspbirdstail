set :application, "graspbirdstail"
set :repository,  "git@github.com:pfdemuizon/#{application}.git"

set :user, "pfdemuizon"
set :group, "pfdemuizon"

set :deploy_to, "/home/pfdemuizon/#{application}"
set :scm, :git
set :keep_releases, 10

role :web, "graspbirdstail.com"
role :app, "graspbirdstail.com"
role :db,  "graspbirdstail.com", :primary => true

set :deploy_via, :remote_cache
set :git_enable_submodules, 1

set :use_sudo, false

after "deploy:update_code", "deploy:symlink_shared"

namespace :deploy do
  task :symlink_shared, :roles => :app, :except => {:no_symlink => true} do
    invoke_command "ln -nfs #{shared_path}/config/database.yml"
  end
end
