class Skillset < ActiveRecord::Base
  belongs_to :profile
  belongs_to :skill

  # Validats that there is a profile_id assocaited with the skill_id
  validates :skill_id, :profile_id, presence: true
  # Validates that each profile can only have a particular skill listed once.
  validates :skill_id, uniqueness: {scope: :profile_id}
  # Value for proficiency must be between 0 - 10
  validates :proficiency, numericality: {greater_than_or_equal_to: 0,
                                         less_than_or_equal_to: 10 }

  def skill
    Skill.where(id: skill_id)[0]
  end
end
