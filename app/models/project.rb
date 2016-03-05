class Project < ActiveRecord::Base

  belongs_to :profile

  # MODEL VALIDATIONS
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness:true

  #simple validation to ensure that the URL is valid
  validates :project_url, :url => {:allow_blank => true}
  validates :github_url, :url => {:allow_blank => true}
end
