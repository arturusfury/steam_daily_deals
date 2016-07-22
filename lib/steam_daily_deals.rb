require 'pry'
require 'nokogiri'
require 'command_line_reporter'
require 'selenium-webdriver'
require 'phantomjs'
require 'open-uri'

require_relative './steam_daily_deals/version'
require_relative '../lib/steam_daily_deals/cli'
require_relative '../lib/steam_daily_deals/deal'
require_relative '../lib/steam_daily_deals/scraper'

Selenium::WebDriver::PhantomJS.path = Phantomjs.path
