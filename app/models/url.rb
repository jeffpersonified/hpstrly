class Url < ActiveRecord::Base
  attr_accessible :in_url, :out_url, :page_views

  before_create :gen_url

  private

  def gen_url
    random_string = SecureRandom.hex(5)
    @out_url = "shortener/#{random_string}"
  end
end
