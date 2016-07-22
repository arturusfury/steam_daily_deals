# Scraper class
class SteamDailyDeals::Scraper
  def self.get_page(url)
    browser = Selenium::WebDriver.for :phantomjs
    browser.get 'http://store.steampowered.com/app/319630/' # url

    if browser.page_source.include?('birth date')
      dropdown = browser.find_element(:id, 'ageYear')
      option = Selenium::WebDriver::Support::Select.new(dropdown)
      option.select_by(:text, '1961')
      option.select_by(:value, '1961')
      browser.find_element(:class, 'btnv6_blue_hoverfade').click
    end

    page_contents = Nokogiri::HTML(browser.page_source)
    browser.quit
    page_contents
  end

  def self.scrape_index_page(index_url)
    deals = []

    get_page(index_url).css('div.cluster_scroll_area').each do |card|
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

    deal_info[:name] = deal_page.css('.apphub_AppName').text

    unless deal_page.css('.game_description_snippet').nil?
      deal_info[:description] = deal_page.css('.game_description_snippet').text
    end

    unless deal_page.css('.date').nil?
      deal_info[:release_date] = deal_page.css('.date').text
    end

    deal_page.css('.user_reviews_summary_row').each do |reviews|
      if reviews.css('subtitle').text == 'Recent:'
        deal_info[:recent_reviews] = reviews.css('.responsive_hidden')
        deal_info[:recent_rating] = reviews.css('.game_review_summary')
      elsif reviews.css('subtitle').text == 'Overall'
        deal_info[:overall_reviews] = reviews.css('.responsive_hidden')
        deal_info[:overall_rating] = reviews.css('.game_review_summary')
      end
    end

    deal_info[:popular_tags] = deal_page.css('.popular_tags').children.css('a').map(&:text)

    deal_info
  end
end
