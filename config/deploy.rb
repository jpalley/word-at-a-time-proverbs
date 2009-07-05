set :application, "word_at_a_time_proverbs"
set :repository,  ""

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
 set :deploy_to, "/home/app/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "improvise.jonathanpalley.com"
role :web, "improvise.jonathanpalley.com"
role :db,  "improvise.jonathanpalley.com", :primary => true


#default_run_options[:pty] = true
set :repository,  "git@github.com:jpalley/word-at-a-time-proverbs.git"
set :scm, "git"
#set :scm_passphrase, "p@ssw0rd" #This is your custom users password
set :user, "app"

ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1



namespace :mod_rails do
  desc <<-DESC
  Restart the application altering tmp/restart.txt for mod_rails.
  DESC
  task :restart, :roles => :app do
    run "touch  #{release_path}/tmp/restart.txt"
  end
end

namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
end

namespace :db
task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/facebooker.yml #{release_path}/config/facebooker.yml"

  end

end

after "deploy:finalize_update", "db:symlink"
