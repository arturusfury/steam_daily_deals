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

  def self.create_from_collection(deals)
    deals.each do |deal|
      new(deal)
    end
  end

  def add_deal_information(deal_info)
    deal_info.each do |key, value|
      send("#{key}=", value)
    end
  end

  def self.all
    @@all
  end
end
