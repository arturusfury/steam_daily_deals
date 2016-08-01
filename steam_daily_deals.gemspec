# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'steam_daily_deals/version'

Gem::Specification.new do |spec|
  spec.name          = 'steam-daily-deals'
  spec.version       = SteamDailyDeals::VERSION
  spec.authors       = ['arturusfury']
  spec.email         = ['bri.reynolds@gmail.com']

  spec.summary       = 'Steam Daily Deal CLI Gem'
  spec.description   = "A CLI gem that goes out to grab today's deals from the steam homepage and allows the user to easily look through the details of each deal"
  spec.homepage      = 'https://github.com/arturusfury/steam_daily_deals'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'nokogiri', '>= 0'
  spec.add_development_dependency 'pry', '>= 0'
  spec.add_development_dependency 'phantomjs', '>= 0'
  spec.add_development_dependency 'headless', '>= 0'
  spec.add_development_dependency 'watir-webdriver', '>= 0'
  spec.add_development_dependency 'command_line_reporter', '>=3.0'
end
