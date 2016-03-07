class Experience < ActiveRecord::Base
  before_validation :smart_add_url_protocol
  belongs_to :profile

  validates :job_title, presence: true
  validates :company_name, presence: true
  validates :company_url, :url => {:allow_blank => true}
  validates :from_date, presence: true
  validates :to_date, presence: true

  mount_uploader :image, ExperienceImageUploader

  protected

  def smart_add_url_protocol
    unless self.company_url.empty?
      unless self.company_url[/\^http:\/\//] || self.company_url[/\^https:\/\//]
        self.company_url = "http://#{self.company_url}"
      end
    end
  end

end
