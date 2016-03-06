class Profile < ActiveRecord::Base
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
  validates :twitter_url,
            :linkedin_url,
            :github_url, uniqueness: true, allow_blank: true, :url => {:allow_blank => true}

  def user_full_name
    user.full_name
  end

end
