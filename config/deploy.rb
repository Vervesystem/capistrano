require 'bundler/capistrano'
set :user, 'surya'
set :domain, 'http://suryakantmaurya.com'
set :applicationdir, "/home/surya/rails_projects/capistrano"
 
set :scm, 'git'
set :repository,  "ssh://git@github.com:Vervesystem/capistrano.git"
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
 
# roles (servers)
role :web, 'http://suryakantmaurya.com'
role :app, 'http://suryakantmaurya.com'
role :db,  'http://suryakantmaurya.com', :primary => true
 
# deploy config
set :deploy_to, "/home/surya/rails_projects/capistrano"
set :deploy_via, :export
 
# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)            # If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"set :use_sudo, false
 
# Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
