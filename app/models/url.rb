class Url < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :original_url, :short_url, :page_views
  
  validates :original_url, :presence => true
  validates :short_url, :uniqueness => true
  validates_format_of :original_url, :with => URI::regexp(%w(http https))

  before_create :gen_url, :if => Proc.new { |url| url.short_url.blank? }

  private

  def gen_url
    random_string = SecureRandom.hex(3)
    self.short_url = "#{random_string}"
  end
end
