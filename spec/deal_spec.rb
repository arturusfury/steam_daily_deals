describe 'Deal' do
  let!(:deal_index_array) do
    [
      {
        final_price: '$40.19',
        app_url: 'spec/fixtures/Grand_Theft_Auto_V.htm',
        availibility: 'Now Available'
      },
      {
        final_price: '$22.49',
        app_url: 'spec/fixtures/Batman_The_Telltale_Series.htm',
        availibility: 'Pre-Order'
      },
      {
        final_price: '$19.99',
        app_url: 'spec/fixtures/Hive_Jump.htm',
        availibility: 'Early Access'
      },
      {
        final_price: 'Free',
        app_url: 'spec/fixtures/BrainBread_2.htm',
        availibility: 'Early Access'
      },
      {
        app_url: 'spec/fixtures/Magic_Duels.htm',
        availibility: 'Free to Play'
      }
    ]
  end

  let!(:deal_hash) do
    {
      name: 'Grand Theft Auto V',
      description: 'GTA Online: Cunning Stunts -- Play Now. Check out a series of brand-new, high octane Stunt Races. Including all new vehicles, racing-themed clothing and more. Buckle up and prepare to experience Southern San Andreas from a whole new perspective.',
      release_date: 'Apr 14, 2015',
      recent_rating: 'Mostly Positive',
      recent_reviews: '8,907',
      overall_rating: 'Very Positive',
      total_reviews: '127,740',
      popular_tags: ['Open World', 'Action', 'Multiplayer', 'First-Person', 'Third Person', 'Crime', 'Adventure', 'Shooter', 'Third-Person Shooter', 'Singleplayer', 'Atmospheric', 'Mature', 'Racing', 'Sandbox', 'Co-op', 'Great Soundtrack', 'Funny', 'Comedy', 'Moddable', 'RPG']
    }
  end

  let!(:gta5) {SteamDailyDeals::Deal.new({final_price: '$40.19', app_url: 'spec/fixtures/Grand_Theft_Auto_V.htm'})}

  after(:each) do
    SteamDailyDeals::Deal.class_variable_set(:@@all, [])
  end

  describe '#initialize' do
    it 'accepts a hash of attributes and creates a deal object' do
      expect{SteamDailyDeals::Deal.new({name: 'Magic Duels', app_url: 'spec/fixtures/Magic_Duels.htm'})}.to_not raise_error
      expect(gta5.final_price).to eq('$40.19')
      expect(gta5.app_url).to eq('spec/fixtures/Grand_Theft_Auto_V.htm')
    end

    it 'expects that the newly created deal class is added to our collection of deals stored in @@all' do
      expect(SteamDailyDeals::Deal.all.first.final_price).to eq('$40.19')
    end
  end

  describe '.create_from_collection' do
    it 'uses our scraper classes to grab the data and create new deals' do
      SteamDailyDeals::Deal.class_variable_set(:@@all, [])
      SteamDailyDeals::Deal.create_from_collection(deal_index_array)
      expect(SteamDailyDeals::Deal.class_variable_get(:@@all).last.app_url).to eq('spec/fixtures/Magic_Duels.htm')
    end
  end

  describe '#add_deal_information' do
    it 'uses our scraper classes to grab all the information on the deal' do
      gta5.add_deal_information(deal_hash)
      expect(gta5.name).to eq('Grand Theft Auto V')
      expect(gta5.overall_rating).to eq('Very Positive')
      expect(gta5.popular_tags).to be_a(Array)
      expect(gta5.popular_tags).to eq(['Open World', 'Action', 'Multiplayer', 'First-Person', 'Third Person', 'Crime', 'Adventure', 'Shooter', 'Third-Person Shooter', 'Singleplayer', 'Atmospheric', 'Mature', 'Racing', 'Sandbox', 'Co-op', 'Great Soundtrack', 'Funny', 'Comedy', 'Moddable', 'RPG'])
    end
  end

  describe '.all' do
    it "returns an array containing all the deal classes we've created" do
      SteamDailyDeals::Deal.class_variable_set(:@@all, [])
      expect(SteamDailyDeals::Deal.all).to match_array([])
    end
  end
end
