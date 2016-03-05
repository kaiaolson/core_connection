class Project < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness:true
  
  #simple validation to ensure that the URL is valid
  validates :project_url, :format => URI::regexp(%w(http https))
  validates :github_url, :format => URI::regexp(%w(http https))
end
