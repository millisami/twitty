# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Twitty::Application


at_exit do
  Worker::App.shutdownall
end


