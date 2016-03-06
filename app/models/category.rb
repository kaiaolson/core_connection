class Category < ActiveRecord::Base
    has_many :skills, dependent: :nullify
    
    validates :name, presence: true, uniqueness: true
end
