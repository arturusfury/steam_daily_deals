# Deal Class
class SteamDailyDeals::Deal
  attr_accessor :name,
                :final_price,
                :app_url,
                :availibility,
                :description,
                :release_date,
                :recent_rating,
                :recent_reviews,
                :overall_rating,
                :total_reviews,
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
