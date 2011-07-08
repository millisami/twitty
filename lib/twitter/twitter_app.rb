class TwitterApp < Sinatra::Base
  set :root, File.dirname(__FILE__)

  get '/twitter' do
    # @user = 'millisami'
    # t = Twitter::Search.new(@user).fetch
    # @tweets = t.results
    

    # Own version
    # Initialize a Twitter search
    @hashtag = "cloudfoundry"
    search = Twitter::Search.new
    @tweets = search.hashtag(@hashtag).language('en').
              # containing("").
              no_retweets.
              per_page(10).
              fetch
    
    erb :twitter
  end

end