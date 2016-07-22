describe 'Deal' do
  let!(:daily_deal_array) do
    [
      {
        name: 'Grand Theft Auto V',
        final_price: '$40.19',
        app_url: 'spec/fixtures/Grand_Theft_Auto_V.htm',
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
        app_url: 'spec/fixtures/Batman_The_Telltale_Series.htm',
        availibility: 'Pre-Order',
        description: 'Enter the fractured psyche of Bruce Wayne and discover the powerful and far-reaching consequences of your choices as the Dark Knight.',
        overall_rating: 'No user reviews',
        popular_tags: ['Batman', 'Adventure', 'Point & Click', 'Story Rich', 'Singleplayer', 'Choices Matter', 'Superhero', 'Action', 'Atmospheric', 'Episodic', 'Memes', 'Dating Sim', 'Quick-Time Events', 'Nudity', 'Dark', 'Anime', 'Comedy', 'Multiplayer']
      },
      {
        name: 'Hive Jump',
        final_price: '$19.99',
        app_url: 'spec/fixtures/Hive_Jump.htm',
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
        app_url: 'spec/fixtures/BrainBread_2.htm',
        availibility: 'Early Access',
        description: 'Grab a weapon, demolish your enemies, level up, become more powerful, let the gore flow, let the limbs fly. BrainBread 2 introduces a zombie fps mixed with RPG / Arcade elements, the game is very action-packed and generally fast-paced.',
        release_date: 'Jul 20, 2016',
        overall_rating: 'Mixed',
        total_reviews: '125',
        popular_tags: ['Early Access', 'Free to Play', 'Action', 'Indie', 'Zombies', 'Adventure', 'Arcade', 'Great Soundtrack', 'RPG', 'Action RPG', 'Classic', 'Multiplayer']
      },
      {
        name: 'Magic Duels',
        app_url: 'spec/fixtures/Magic_Duels.htm',
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

  let!(:gta5) {SteamDailyDeals::Deal.new({name: "Grand Theft Auto 5", final_price: '$40.19', app_url: 'spec/fixtures/Grand_Theft_Auto_V.htm'})}

  after(:each) do
    SteamDailyDeals::Deal.class_variable_set(:@@all, [])
  end

  describe '#initialize' do
    it 'accepts a hash of attributes and creates a deal object' do
      expect{SteamDailyDeals::Deal.new({name: 'Magic Duels', app_url: 'spec/fixtures/Magic_Duels.htm'})}.to_not raise_error
      expect(gta5.name).to eq('Grand Theft Auto 5')
      expect(gta5.final_price).to eq('$40.19')
      expect(gta5.app_url).to eq('spec/fixtures/Grand_Theft_Auto_V.htm')
    end
  end

  describe '.all' do
    it "returns an array containing all the deal classes we've created" do
      SteamDailyDeals::Deal.class_variable_set(:@@all, [])
      expect(SteamDailyDeals::Deal.all).to match_array([])
    end
  end


end
