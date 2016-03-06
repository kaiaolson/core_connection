class Skill < ActiveRecord::Base
  belongs_to :category
  has_many :skillsets, dependent: :nullify
  has_many :profiles, through: :skillsets

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :skillsets

  def proficiency(profile)
    Skillset.where(skill_id: id, profile_id: profile.id)[0].proficiency
  end
end
