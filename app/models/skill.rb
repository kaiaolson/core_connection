class Skill < ActiveRecord::Base
  belongs_to :category
  has_many :skillsets, dependent: :nullify
  has_many :profiles, through: :skillsets

  validates :name, presence: true, uniqueness: true
end
