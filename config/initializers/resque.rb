require 'resque'

services = JSON.parse(ENV['VCAP_SERVICES'])
redis_key = services.keys.select { |svc| svc =~ /redis/i }.first
redis = services[redis_key].first['credentials']
redis_conf = {:host => redis['hostname'], :port => redis['port'], :password => redis['password']}

Resque.redis = Redis.new(redis_conf)