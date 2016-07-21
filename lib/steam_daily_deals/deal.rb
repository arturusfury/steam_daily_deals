# Deal Class
class SteamDailyDeals::Deal
  attr_accessor :name,
                :final_price,
                :app_url,
                :description,
                :release_date,
                :ratings,
                :popular_tags

  @@all = []

  def initialize(deal)
    deal.each do |key, value|
      send("#{key}=", value)
    end

    @@all << self
  end

  def self.all
    @@all
  end
end
