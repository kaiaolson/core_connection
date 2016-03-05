class Link < ActiveRecord::Base
  belongs_to :profile

  validates :github_url, :url => {:allow_blank => true}
  validates :twitter_url, :url => {:allow_blank => true}
  validates :linkedin_url, :url => {:allow_blank => true}
end
