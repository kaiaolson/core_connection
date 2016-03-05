class Membership < ActiveRecord::Base
  belongs_to :profile
  belongs_to :project

  # Validats that there is a profile_id assocaited with the project_id
  validates :project_id, :profile_id, presence: true
  # Validates that each profile can only have a particular project listed once.
  validates :project_id, uniqueness: {scope: :profile_id}
end
