class Profile < ActiveRecord::Base
  belongs_to :user

  # associations for skillset
  has_many :skillsets, dependent: :destroy
  has_many :skills, through: :skillsets

  # associations for projects
  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships

  # associations for experience
  has_many :experiences, dependent: :destroy

  # associations for education
  has_many :educations, dependent: :destroy

  # associations for links (a profile can have more than 1 set of links right??)
  has_many :links, dependent: :destroy


  # MODEL VALIDATIONS
  validates :user_id, :profile_id, presence: true
  # limit max to 140 characters for tag_line
  validates :tag_line, presence: true, length: {maximum: 140}
  # limit max to 500 characters for description
  validates :description, presence: true, length: {maximum: 500}
  validates_inclusion_of :availability, in: [true, false]
  
end
