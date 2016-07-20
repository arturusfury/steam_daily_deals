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

    menu
  end

  def menu
    print "Please type in list to get a list of today's deals on steam or type exit: ".cyan
    input = nil
    until input == 'exit'
      input = gets.strip.downcase
      case input
      when 'list'
        list_deals
      when '1'
        show_deal(input)
      when '2'
        show_deal(input)
      when 'exit'
        puts 'See you tomorrow!'.green
        break
      else
        puts "I'm sorry that was not a valid entry".red
        print "Please type list to get a list of today's deals or type exit to quit the program: ".cyan
      end
    end
  end

  def list_deals
    extend CommandLineReporter

    table(border: true) do
      row do
        column('No', width: 3, align: 'center')
        column('Title', width: 45, padding: 2)
        column('Price', width: 8, align: 'right')
        column('Status', width: 15)
      end
      row do
        column('1', color: 'cyan')
        column('Batman: Tell Tale')
        column('$19.99', color: 'red')
        column('Pre-Order', color: 'green')
      end
      row do
        column('2', color: 'cyan')
        column('Trove')
        column('Free', color: 'yellow')
        column('Available', color: 'green')
      end
    end

    puts 'Please enter the number of the deal you wish to see more information about'
    print 'You may also type list to see the list again or exit to quit: '
  end

  def show_deal(deal)
    extend CommandLineReporter

    case deal
    when '1'
      # Deal Title and Price
      table(border: true) do
        row do
          column('Batman: Tell Tale', width: 67, align: 'center', color: 'cyan')
          column('$19.99', width: 10, align: 'center', color: 'red')
        end
      end

      # Deal Description
      table(border: true) do
        row do
          column('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', width: 80)
        end
      end

      # Details
      table(border: true) do
        row do
          column('Release Date', width: 33, color: 'cyan')
          column('October 2016', width: 44)
        end
        row do
          column('Customer Reviews', width: 33, color: 'cyan')
          column('Mostly Negative (1 Review)', width: 44, color: 'red')
        end
        row do
          column('Popular Tags', width: 33, color: 'cyan')
          column('Batman, Tell Tale, Storytelling', width: 44)
        end
      end
    when '2'
      # Deal Title and Price
      table(border: true) do
        row do
          column('Trove', width: 67, align: 'center', color: 'cyan')
          column('Free', width: 10, align: 'center', color: 'green')
        end
      end

      # Deal Description
      table(border: true) do
        row do
          column('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', width: 80)
        end
      end

      # Details
      table(border: true) do
        row do
          column('Release Date', width: 33, color: 'cyan')
          column('January 1, 2012', width: 44)
        end
        row do
          column('Customer Reviews', width: 33, color: 'cyan')
          column('Mostly Positive (120 Reviews)', width: 44, color: 'green')
        end
        row do
          column('Popular Tags', width: 33, color: 'cyan')
          column('Open World, MMO, Building', width: 44)
        end
      end
    end

    print "Please type list to get a list of today's deals or type exit to quit the program: ".cyan
  end
end
