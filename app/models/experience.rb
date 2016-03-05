class Experience < ActiveRecord::Base
  belongs_to :profile

  validates :job_title, presence: true
  validates :description, presence: true
  validates :company_name, presence: true
  validates :company_url, :url => {:allow_blank => true}
  validates :from_date, presence: true
  validates :to_date, presence: true
end
