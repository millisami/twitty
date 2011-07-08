# require File.join(File.dirname(__FILE__), '..','worker')
require 'resque_worker/worker'
require 'twitter/twitter_app'

Twitty::Application.routes.draw do
  resources :wall_posts
  
  match "/fire_worker", :to => Worker::App
  
  match '/twitter',     :to => TwitterApp
end
