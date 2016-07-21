require 'spec_helper'

describe 'SteamDailyDeals::Scraper' do
  let!(:daily_deal_array) do
    [
      {
        name: 'Grand Theft Auto V',
        final_price: '$40.19',
        app_url: './fixtures/Grand_Theft_Auto_V.htm',
        availibility: 'Now Available',
        description: 'GTA Online: Cunning Stunts -- Play Now. Check out a series of brand-new, high octane Stunt Races. Including all new vehicles, racing-themed clothing and more. Buckle up and prepare to experience Southern San Andreas from a whole new perspective.',
        release_date: 'Apr 14, 2015',
        recent_rating: 'Mostly Positive',
        recent_reviews: '8,907',
        overall_rating: 'Very Positive',
        total_reviews: '127,740',
        popular_tags: ['Open World', 'Action', 'Multiplayer', 'First-Person', 'Third Person', 'Crime', 'Adventure', 'Shooter', 'Third-Person Shooter', 'Singleplayer', 'Atmospheric', 'Mature', 'Racing', 'Sandbox', 'Co-op', 'Great Soundtrack', 'Funny', 'Comedy', 'Moddable', 'RPG']
      },
      {
        name: 'Batman - The Telltale Series',
        final_price: '$22.49',
        app_url: './fixtures/Batman_The_Telltale_Series.htm',
        availibility: 'Pre-Order',
        description: 'Enter the fractured psyche of Bruce Wayne and discover the powerful and far-reaching consequences of your choices as the Dark Knight.',
        overall_rating: 'No user reviews',
        popular_tags: ['Batman', 'Adventure', 'Point & Click', 'Story Rich', 'Singleplayer', 'Choices Matter', 'Superhero', 'Action', 'Atmospheric', 'Episodic', 'Memes', 'Dating Sim', 'Quick-Time Events', 'Nudity', 'Dark', 'Anime', 'Comedy', 'Multiplayer']
      },
      {
        name: 'Hive Jump',
        final_price: '$19.99',
        app_url: './fixtures/Hive_Jump.htm',
        availibility: 'Early Access',
        description: 'HIVE JUMP is a sci-fi action platformer for 1-4 players blending run ‘n gun gameplay with roguelike elements.',
        release_date: 'Jul 20, 2016',
        overall_rating: 'Positive',
        total_reviews: '7',
        popular_tags: ['Early Access', 'Action', 'Indie', 'Procedural Generation', 'Multiplayer', 'Local Co-op', 'Sci-fi', 'Aliens', 'Pixel Graphics', 'Co-op', 'Great Soundtrack', 'Arcade', 'Colorful', 'Platformer']
      },
      {
        name: 'BrainBread 2',
        final_price: 'Free',
        app_url: './fixtures/BrainBread_2.htm',
        availibility: 'Early Access',
        description: 'Grab a weapon, demolish your enemies, level up, become more powerful, let the gore flow, let the limbs fly. BrainBread 2 introduces a zombie fps mixed with RPG / Arcade elements, the game is very action-packed and generally fast-paced.',
        release_date: 'Jul 20, 2016',
        overall_rating: 'Mixed',
        total_reviews: '125',
        popular_tags: ['Early Access', 'Free to Play', 'Action', 'Indie', 'Zombies', 'Adventure', 'Arcade', 'Great Soundtrack', 'RPG', 'Action RPG', 'Classic', 'Multiplayer']
      },
      {
        name: 'Magic Duels',
        app_url: './fixtures/Magic_Duels.htm',
        availibility: 'Free to Play',
        description: 'MORE CARDS. MORE STRATEGY. BIGGER STORY. Playing Magic with your friends has never been more fun! Featuring more than 125 NEW unique earnable cards from Magic’s Eldritch Moon set, NEW Story Content, and more.',
        release_date: 'Jul 29, 2015',
        recent_rating: 'Mixed',
        recent_reviews: '357',
        overall_rating: 'Mixed',
        total_reviews: '12,333',
        popular_tags: ['Free to Play', 'Trading Card Game', 'Card Game', 'Strategy', 'Magic', 'Multiplayer', 'Co-op', 'Singleplayer', 'Fantasy', 'Online Co-Op']
      }
    ]
  end

  describe '#scrape_index_page' do
    index_url = 'spec/fixtures/Welcome_to_Steam.htm'
    daily_deals = SteamDailyDeals::Scraper.scrape_index_page(index_url)

    it 'is a class method that scrapes the steam homepage and returns an array of hashes for each daily deal' do
      expect(daily_deals).to be_a(Array)
      expect(daily_deals.first).to have_key(:final_price)
      expect(daily_deals.first).to have_key(:app_url)
      expect(daily_deals.first).to have_key(:availibility)
    end

    it "grabs the first deal from the homepage and set's the values in the hash correctly" do
      expect(daily_deals.first[:final_price]).to eq(daily_deal_array[0][:final_price])
      expect(daily_deals.first[:app_url]).to eq(daily_deal_array[0][:app_url])
    end

    it "grabs the second deal from the homepage and set's the values in the hash correctly" do
      expect(daily_deals[1][:final_price]).to eq(daily_deal_array[1][:final_price])
      expect(daily_deals[1][:app_url]).to eq(daily_deal_array[1][:app_url])
    end

    it "grabs the third deal from the homepage and set's the values in the hash correctly" do
      expect(daily_deals[2][:final_price]).to eq(daily_deal_array[2][:final_price])
      expect(daily_deals[2][:app_url]).to eq(daily_deal_array[2][:app_url])
    end

    it "grabs the fourth deal from the homepage and set's the values in the hash correctly" do
      expect(daily_deals[3][:final_price]).to eq(daily_deal_array[3][:final_price])
      expect(daily_deals[3][:app_url]).to eq(daily_deal_array[3][:app_url])
    end

    it "grabs the fifth deal from the homepage and set's the values in the hash correctly" do
      expect(daily_deals[4][:app_url]).to eq(daily_deal_array[4][:app_url])
    end
  end

  describe '#scrape_deal_page' do
    index_url = 'spec/fixtures/Welcome_to_Steam.htm'
    daily_deals = SteamDailyDeals::Scraper.scrape_index_page(index_url)

    it "makes sure our data that has been returned is a hash" do
      deal_info = SteamDailyDeals::Scraper.scrape_deal_page(daily_deals[0][:app_url])
      expect(deal_info).to be_a(Hash)
    end

    it "makes sure hash contains the right keys" do
      deal_info = SteamDailyDeals::Scraper.scrape_deal_page(daily_deals[0][:app_url])
      expect(deal_info).to have_key(:name)
      expect(deal_info).to have_key(:description)
      expect(deal_info).to have_key(:overall_rating)
      expect(deal_info).to have_key(:popular_tags)
    end

    it "scrapes the name from our deal page and adds it to our hash" do
      deal_info = SteamDailyDeals::Scraper.scrape_deal_page(daily_deal[0][:app_url])
      expect(deal_info[:name]).to eq(daily_deal_array[0][:name])
    end
  end
end
