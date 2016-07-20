# Steam Daily Deals Gem

Using this ruby CLI gem you will be able to quickly see which games are on sale today. It will pull the information directly from the steam homepage so it should always be the most up to date information available to the public!

## Installation

    $ gem install steam_daily_deals

## Usage

    $ steam_daily_deals

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arturusfury/steam_daily_deals. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Expected Flow

Type `steam_daily_deals`

Get a message back `Welcome! Here are the daily deals available on Steam today:`

    1. Batman: Tell Tale Games  $19.99  Pre-Order
    2. Assassin's Creed  $59.99  Available
    3. Trove  Free  Available

Get another prompt `Please enter the number of the deal you would like more information about`

Type `1`

    Batman: Tell Tale Games       $19.99
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

    Release Date: October 2016
    Reviews: No User Reviews Yet
    Popular Tags: Batman, Tell Tale, Story telling

Get another prompt `Would you like to see the list of deals again or would you like to exit?`

Expect user to enter `deals` or `list` or `steam_daily_deals` or `exit`
