class Education < ActiveRecord::Base
  belongs_to :profile

  validates :school, presence: true
  validates :degree, presence: true
  validates :school_url, :format => URI::regexp(%w(http https))
end
