# Adding Colors to our strings
class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end
end

# CLI class
class SteamDailyDeals::CLI
  def call
    extend CommandLineReporter

    # This part here looks pretty ugly with the heredoc, but I'm not sure of a
    # better way to make sure I have all of this text centered and keep the look
    # I was working toward.  It can be completely removed and just made to have
    # a regular "Welcome to the Steam Daily Deals" line, but this was an astetic
    # choice
    puts <<-DOC

                                            ad88888ba  888888888888  88888888888         db         88b           d88
                                           d8"     "8b      88       88                 d88b        888b         d888
                                           Y8,              88       88                d8'`8b       88`8b       d8'88
                                           `Y8aaaaa,        88       88aaaaa          d8'  `8b      88 `8b     d8' 88
                                             `"""""8b,      88       88"""""         d8YaaaaY8b     88  `8b   d8'  88
                                                   `8b      88       88             d8""""""""8b    88   `8b d8'   88
                                           Y8a     a8P      88       88            d8'        `8b   88    `888'    88
                                            "Y88888P"       88       88888888888  d8'          `8b  88     `8'     88
                                                      ____          _  _           ____                _
                                                     |  _ \\   __ _ (_)| | _   _   |  _ \\   ___   __ _ | | ___
                                                     | | | | / _` || || || | | |  | | | | / _ \\ / _` || |/ __|
                                                     | |_| || (_| || || || |_| |  | |_| ||  __/| (_| || |\\__ \\
                                                     |____/  \\__,_||_||_| \\__, |  |____/  \\___| \\__,_||_||___/
                                                                           |___/

    DOC

    horizontal_rule(width: 160, color: 'red')
    header(title: 'Please wait while we load todays daily deals', color: 'red', align: 'center', width: 160, spacing: 0)
    make_deals
    header(title: 'This may take a minute to load everything', color: 'red', align: 'center', width: 160, spacing: 0)
    add_deal_details
    horizontal_rule(width: 160, color: 'red')
    vertical_spacing 1
    menu
  end

  def menu
    print "Please type in list to get a list of today's deals on steam or type exit: ".cyan
    input = nil
    until input == 'exit'
      input = gets.strip.downcase

      if input.to_i.between?(1, SteamDailyDeals::Deal.all.count)
        show_deal(input.to_i)
      elsif input == 'list'
        list_deals
      elsif input == 'exit'
        puts 'See you tomorrow!'.green
      else
        puts "I'm sorry that was not a valid entry".red
        print "Please type list to get a list of today's deals or type exit to quit the program: ".cyan
      end
    end
  end

  def make_deals
    deals_array = SteamDailyDeals::Scraper.scrape_index_page.uniq
    SteamDailyDeals::Deal.create_from_collection(deals_array)
  end

  def add_deal_details
    SteamDailyDeals::Deal.all.each do |deal|
      info = SteamDailyDeals::Scraper.scrape_deal_page(deal.app_url)
      deal.add_deal_information(info)
      loading_info = "Loaded #{deal.name}"
      header(title: loading_info, color: 'red', align: 'center', width: 160, spacing: 0)
    end
  end

  def list_deals
    extend CommandLineReporter

    table(border: true) do
      row do
        column('No', width: 6, align: 'center')
        column('Title', width: 94, padding: 2, align: 'center')
        column('Price', width: 16, align: 'center')
        column('Status', width: 31, align: 'center')
      end
      deals = SteamDailyDeals::Deal.all

      deals.each.with_index(1) do |deal, i|
        row do
          column(i.to_s, color: 'cyan')
          column(deal.name)
          column(deal.final_price, color: 'red', align: 'right')
          column(deal.availibility, color: 'green', align: 'left')
        end
      end
    end

    puts 'Please enter the number of the deal you wish to see more information about'
    print 'You may also type list to see the list again or exit to quit: '
  end

  def show_deal(deal)
    extend CommandLineReporter

    # A cheaty way to get a seperation in between the listed deals
    vertical_spacing 2

    deal_details = SteamDailyDeals::Deal.all[deal - 1]

    # Deal Title and Price
    table(border: true) do
      row do
        column(deal_details.name, width: 143, align: 'center', color: 'cyan')
        if deal_details.final_price.nil? || deal_details.final_price == ''
          column('Free', width: 10, align: 'center', color: 'red')
        else
          column(deal_details.final_price, width: 10, align: 'center', color: 'red')
        end
      end
    end

    # Deal Description
    table(border: true) do
      row do
        column(deal_details.description, width: 156)
      end
    end

    # Details
    table(border: true) do
      unless deal_details.release_date.nil?
        row do
          column('Release Date', width: 53, color: 'cyan')
          column('October 2016', width: 100)
        end
      end

      unless deal_details.overall_rating.nil?
        review_text = "#{deal_details.overall_rating} #{deal_details.total_reviews}"
        row do
          column('Customer Reviews', width: 53, color: 'cyan')
          column(review_text, width: 100, color: 'red')
        end
      end

      unless deal_details.recent_rating.nil?
        review_text = "#{deal_details.recent_rating} #{deal_details.recent_reviews}"
        row do
          column('Customer Reviews', width: 53, color: 'cyan')
          column(review_text, width: 100, color: 'red')
        end
      end

      row do
        column('Popular Tags', width: 53, color: 'cyan')
        column(deal_details.popular_tags.join(", "), width: 100)
      end
    end

    print "Please type list to get a list of today's deals or type exit to quit the program: ".cyan
  end
end
