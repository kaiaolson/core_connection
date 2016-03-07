class Project < ActiveRecord::Base
  before_validation :smart_add_project_url_protocol
  before_validation :smart_add_github_url_protocol
  belongs_to :profile

  # MODEL VALIDATIONS
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness:true

  #simple validation to ensure that the URL is valid
  validates :project_url, :url => {:allow_blank => true}
  validates :github_url, :url => {:allow_blank => true}

  protected

  def smart_add_project_url_protocol
    unless self.project_url[/\^http:\/\//] || self.project_url[/\^https:\/\//]
      self.project_url = "http://#{self.project_url}"
    end
  end
  
  def smart_add_github_url_protocol
    unless self.github_url[/\^http:\/\//] || self.github_url[/\^https:\/\//]
      self.github_url = "http://#{self.github_url}"
    end
  end
end
