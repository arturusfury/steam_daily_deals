# Scraper class
class SteamDailyDeals::Scraper
  def self.get_page(url)
    browser = Selenium::WebDriver.for :phantomjs
    browser.get url

    if browser.page_source.include?('not be appropriate for all')
      browser.find_element(:class, 'btn_grey_white_innerfade').click
    end

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

  def self.scrape_index_page(index_url = 'http://store.steampowered.com')
    page = get_page(index_url).css('div.cluster_scroll_area')
    page.each_with_object([]) do |card, arr|
      card.css('a.cluster_capsule').each do |deal|
        app_url = deal.attr('href').to_s
        final_price = deal.css('.discount_final_price').text
        availibility = deal.css('.main_cap_status').text
        arr <<  { app_url: app_url, final_price: final_price, availibility: availibility }
      end
    end
  end

  def self.scrape_deal_page(page_url)
    deal_page = get_page(page_url)

    deal_info = {}

    deal_info[:name] = deal_page.css('.apphub_AppName').text

    unless deal_page.css('.game_description_snippet').nil?
      deal_info[:description] = deal_page.css('.game_description_snippet').text.delete("\t").delete("\n")
    end

    unless deal_page.css('.date').nil?
      deal_info[:release_date] = deal_page.css('.date').text
    end

    # The following code isn't very ruby-ish, but I've had a hard time trying
    # to figure out how to grab these elements with nokogiri
    # it's not the worst code ever, the double selector for the span's gets a
    # little ugly and confusing for someone to read
    # if deal_page.css('.subtitle').text.include?('Recent')
    #   deal_info[:recent_rating] = deal_page.search('div[text()="Recent:"] + span').text
    #   deal_info[:recent_reviews] = deal_page.search('div[text()="Recent:"] + span + span').text
    # end
    scrape_rating(deal_page, deal_info, 'Recent')
    scrape_rating(deal_page, deal_info, 'Overall')

    deal_info[:popular_tags] = deal_page.css('.popular_tags').children.css('a').map(&:text)

    deal_info[:popular_tags].map { |tag| tag.delete!("\t").delete!("\n") }

    deal_info
  end

  def self.scrape_rating(page, hash, option)
    if page.css('.subtitle').text.include?(option)
      hash[:overall_rating] = page.search('div[text()="' + option + ':"] + span').text
      hash[:total_reviews] = page.search('div[text()="' + option + ':"] + span + span').text
    end
  end
end
