# Scraper class
class SteamDailyDeals::Scraper
  def self.scrape_index_page(index_url)
    deals = []

    browser = Selenium::WebDriver.for :phantomjs
    browser.get index_url
    index_page = Nokogiri::HTML(browser.page_source)
    browser.quit

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
    deal_page = Nokogiri::HTML(open(page_url))

    deal_info = {}

    deal_info[:name] = 'Grand Theft Auto V'
    deal_info[:description] = 'GTA Online Cunning Stunts -- Play Now. Check out a series of brand-new, high octane Stunt Races. Including all new vehicles, racing-themed clothing and more. Buckle up and prepare to experience Southern San Andreas from a whole new perspective.'
    deal_info[:release_date] = 'Apr 14, 2015'
    deal_info[:recent_rating] = 'Mostly Positive'
    deal_info[:recent_reviews] = '8,907'
    deal_info[:overall_rating] = 'Very Positive'
    deal_info[:total_reviews] = '127,740'
    deal_info[:popular_tags] = ['Open World', 'Action', 'Multiplayer', 'First-Person', 'Third Person', 'Crime', 'Adventure', 'Shooter', 'Third-Person Shooter', 'Singleplayer', 'Atmospheric', 'Mature', 'Racing', 'Sandbox', 'Co-op', 'Great Soundtrack', 'Funny', 'Comedy', 'Moddable', 'RPG']

    deal_info
  end
end
