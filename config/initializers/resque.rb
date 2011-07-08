require 'resque'
if ENV['VCAP_SERVICES']
  services = JSON.parse(ENV['VCAP_SERVICES'])
  redis_key = services.keys.select { |svc| svc =~ /redis/i }.first
  redis = services[redis_key].first['credentials']
  redis_conf = {:host => redis['hostname'], :port => redis['port'], :password => redis['password']}

  Resque.redis = Redis.new(redis_conf)
else
  config = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]
  Resque.redis = Redis.new(:host => config['host'], :port => config['port'])
end