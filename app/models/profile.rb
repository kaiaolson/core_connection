class Profile < ActiveRecord::Base
  before_validation :smart_add_twitter_url_protocol, :smart_add_github_url_protocol, :smart_add_linkedin_url_protocol
  belongs_to :user

  # associations for skillset
  has_many :skillsets, dependent: :destroy
  has_many :skills, through: :skillsets

  # associations for projects
  has_many :projects, dependent: :destroy

  # associations for experience
  has_many :experiences, dependent: :destroy

  # associations for education
  has_many :educations, dependent: :destroy


  # MODEL VALIDATIONS
  # limit max to 140 characters for tag_line
  validates :tagline, presence: true, length: {maximum: 140}
  # limit max to 500 characters for description
  validates :description, presence: true, length: {maximum: 500}
  validates_inclusion_of :availability, in: [true, false]

  # Social media link validations
  validates :twitter_url, uniqueness: true, allow_blank: true, :url => {:allow_blank => true}
  validates :linkedin_url, uniqueness: true, allow_blank: true, :url => {:allow_blank => true}
  validates :github_url, uniqueness: true, allow_blank: true, :url => {:allow_blank => true}

  # Resume & Photo uploaders
  mount_uploader :resume, ResumeUploader
  mount_uploader :photo, ProfilePhotoUploader

  def user_full_name
    user.full_name
  end

  def approved
    Profile.all.each do |profile|
      profile if profile.user.status
    end
  end

  protected

  def smart_add_twitter_url_protocol
    unless self.twitter_url[/\^http:\/\//] || self.twitter_url[/\^https:\/\//]
      self.twitter_url = "http://#{self.twitter_url}"
    end
  end

  def smart_add_linkedin_url_protocol
    unless self.linkedin_url[/\^http:\/\//] || self.linkedin_url[/\^https:\/\//]
      self.linkedin_url = "http://#{self.linkedin_url}"
    end
  end

  def smart_add_github_url_protocol
    unless self.github_url[/\^http:\/\//] || self.github_url[/\^https:\/\//]
      self.github_url = "http://#{self.github_url}"
    end
  end
end
