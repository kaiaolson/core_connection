class Link < ActiveRecord::Base
  belongs_to :profile

  validates :github_url, :format => URI::regexp(%w(http https))
  validates :twitter_url, :format => URI::regexp(%w(http https))
  validates :linkedin_url, :format => URI::regexp(%w(http https))
end
