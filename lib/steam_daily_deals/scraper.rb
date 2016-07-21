# Scraper class
class SteamDailyDeals::Scraper
  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))

    deals = []

    index_page.css('div.cluster_scroll_area').each do |card|
      card.css('a.cluster_capsule').each do |deal|
        app_url = deal.attr('href').to_s
        final_price = deal.css('.discount_final_price').text
        availibility = deal.css('.main_cap_status').text
        deals << { app_url: app_url, final_price: final_price, availibility: availibility }
      end
    end

    deals
  end

  def self.scrape_deal_page(page_url)
    # Stuff
  end
end
