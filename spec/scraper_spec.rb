require_relative 'spec_helper'

describe 'SteamDailyDeals::Scraper' do
  let!(:daily_deal_array) do
    [
      {
        name: 'Grand Theft Auto V',
        final_price: '$40.19',
        app_url: 'http://store.steampowered.com/app/271590/?snr=1_4_4__100'
        description:
        release_date:
        ratings:
        popular_tags:
      },
      {
        name: 'Batman',
        final_price: '$22.49',
        app_url: 'http://store.steampowered.com/app/498240/?snr=1_4_4__100_2'
        description:
        release_date:
        ratings:
        popular_tags:
      },
      {
        name: 'Hive Jump',
        final_price: '$19.99',
        app_url: 'http://store.steampowered.com/app/295670/?snr=1_4_4__130_14'
        description:
        release_date:
        ratings:
        popular_tags:
      },
      {
        name: 'Brainbread',
        final_price: 'Free',
        app_url: 'http://store.steampowered.com/app/346330/?snr=1_4_4__130_12'
        description:
        release_date:
        ratings:
        popular_tags:
      },
      {
        name: 'Magic Duels',
        final_price: 'Free',
        app_url: 'http://store.steampowered.com/app/316010/?snr=1_4_4__100"'
        description:
        release_date:
        ratings:
        popular_tags:
      }
    ]
  end
end
