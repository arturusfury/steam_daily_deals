# Steam Daily Deals Gem

Using this ruby CLI gem you will be able to quickly see which games are on sale today. It will pull the information directly from the steam homepage so it should always be the most up to date information available to the public!

## Usage

    $ ./bin/steam-daily-deals

## Development

You'll need to change the version file in `version.rb` before trying to run `bundle install`. After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The first time you run this program it might need to install PhantomJS if it isn't installed already.  This will be automatic and should only happen once.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arturusfury/steam_daily_deals. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Credits

I would like to thank the creators of Selenium-Webkit (https://github.com/SeleniumHQ/selenium/tree/master/rb), PhantomJS (https://github.com/ariya/phantomjs), the PhantomJS gem (https://github.com/colszowka/phantomjs-gem), and the Command Line Reporter (https://github.com/wbailey/command_line_reporter) tools for all their hard work which helped me complete my project.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
