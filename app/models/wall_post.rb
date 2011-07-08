class WallPost < ActiveRecord::Base
  
  after_save :tweet_post
  
  def tweet_post
    
  end
end
