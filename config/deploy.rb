require 'fileutils'

set :application, "habriki"
set :deploy_via, :remote_cache
set :use_sudo, false

File.open(File.dirname(__FILE__) + '/deploy_params.rb').read

set :scm, :git

set :restart_method, :passenger
set :stack, :passenger_nginx

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

require './config/boot'
require 'hoptoad_notifier/capistrano'
