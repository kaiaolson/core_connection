class Project < ActiveRecord::Base

  has_many :memberships, dependent: :nullify
  has_many :profiles, through: :memberships


  # MODEL VALIDATIONS
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness:true
  
  #simple validation to ensure that the URL is valid
  validates :project_url, :format => URI::regexp(%w(http https))
  validates :github_url, :format => URI::regexp(%w(http https))
end
