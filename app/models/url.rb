class Url < ActiveRecord::Base
  belongs_to :user

  attr_accessible :original_url, :short_url, :page_views

  validates :original_url, :presence => { :message => "You're not from around here, are you? Enter a url." }
  validates :short_url, :uniqueness => { :message => "Choose a unique url. Maybe you don't know any..." }

  validates_format_of :original_url,
                      :with => URI::regexp(%w(http https)),
                      :message => "Choose a valid url. Yours was too obscure."

  before_create :gen_url, :if => Proc.new { |url| url.short_url.blank? }

  private

  def gen_url
    words = [ "street", "art", "odd", "future", "vinyl", "food", "truck",
              "tofu", "whatever", "narwhal", "fannypack", "readymade",
              "godard", "blog", "austin", "sf", "missiondist", "gastropub",
              "farmtotable", "dolores", "8bit", "pitchfork", "leggings",
              "authentic", "helvetica", "etsy", "biodiesel", "semiotics",
              "selvage", "denim", "occupy", "diy", "mustache", "stache",
              "skateboard", "gentrify", "cardigan", "steinbeck", "sriracha",
              "postironic", "post-modern", "ethical", "jorts", "skinnyjeans",
              "trustfund", "hoodie", "banksy", "vegan", "pbr", "artisan",
              "beard", "fingerstache", "organic", "bespoke", "sustainable",
              "irony", "yogi", "popup", "fourbarrel", "sightglass", "neat",
              "kalechips", "porkbelly", "tumblr", "warbyparker", "quinoa",
              "fixie", "tattooed", "wesanderson", "wes", "typewriter", "cliche",
              "synth", "letterpress", "forage", "stumptown", "thundercats",
              "plus1", "streetart", "sriracha", "photobooth", "butcher",
              "chillwave", "aesthetic", "viral", "directtrade", "fourloko",
              "smallbatch", "brunch", "pourover", "soldout", "flexitarian",
              "messengerbag", "highlife", "polaroid", "instagram", "bicycle",
              "pinterest", "mastercleanse", "retro", "gluten-free", "umami",
              "iphone", "chambray", "godard", "americanapparel", "wayfarers",
              "brooklyn", "keffiyeh", "salvia", "existential", "kierkegaard",
              "introverted", "vintage", "moleskine", "yolo", "fomo", "obscure" ]

    self.short_url = "#{words.sample}_#{words.sample}_#{words.sample}"
  end
end
