class Education < ActiveRecord::Base
  belongs_to :profile

  validates :school, presence: true
  validates :degree, presence: true
  validates :school_url, :url => {:allow_blank => true}

  mount_uploader :image, EducationImageUploader

end
