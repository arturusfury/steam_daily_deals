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

  describe '#scrape_index_page' do
    it 'is a class method that scrapes the steam homepage and returns an array of hashes for each daily deal' do
      index_url = './fixtures/Welcome to Steam.htm'
      daily_deals = SteamDailyDeals::Scraper.scrape_index_page(index_url)
      expect(daily_deals).to be_a(Array)
      expect(daily_deals.first).to have_key(:final_price)
      expect(daily_deals.first).to have_key(:app_url)
    end
  end

  describe '#scrape_deal_page' do

  end
end
