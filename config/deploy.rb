if ENV['DEPLOY'] == 'PRODUCTION'
  puts "*** Deploying to the \033[1;41m  PRODUCTION  \033[0m servers!"
  set :application, "tellthemimdead.com"
else
  puts "*** Deploying to the \033[1;42m  STAGING  \033[0m server!"
  set :application, "dev.tellthemimdead.com"
end

set :location, "cmpnr.com"

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:Carpela/tellthemimdead.git"  # Your clone URL
set :scm, "git"
set :user, "cmpnr"  # The server's user for deploys
set :password, "cmpnrpa55"

set :use_sudo, false

set :branch, "master"
set :deploy_via, :remote_cache

set :git_enable_submodules, 1

role :web, location # Your HTTP server, Apache/etc
role :app, location # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(release_path, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :install, :roles => :app do
    run "cd #{current_path} && bundle install"

    on_rollback do
      if previous_release
        run "cd #{previous_release} && bundle install"
      else
        logger.important "no previous release to rollback to, rollback of bundler:install skipped"
      end
    end
  end

  task :bundle_new_release, :roles => :db do
    bundler.create_symlink
    bundler.install
  end
end

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.8.7'        # Or whatever env you want it to run in.
set :rvm_type, :user


before "deploy:start", "deploy:migrate"

after "deploy:rollback:revision", "bundler:install"
before "deploy:start", "bundler:bundle_new_release"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
