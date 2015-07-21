require 'xbox_live_api'
require 'models/game'

describe XboxLiveApi do
  let(:email) { 'xb0xliveapi@hotmail.com' }
  let(:password) { '9UXxCGkAUfRtp3QT' }
  let(:api) { XboxLiveApi.new }
  describe '#login' do
    it 'will log a user in with the specified email and password' do
      expect { api.login(email, password) }.to_not raise_error
    end
  end
  context 'after a user has been logged in' do
    before(:each) do
      api.login(email, password)
    end

    describe '#get_profile' do
      it 'returns the profile information for the user' do
        profile = {
            id: '2535458020453936',
            gamerTag: 'AssuredSteam271',
            gamerScore: 15
        }
        expect(api.get_profile).to eql profile
      end
    end

    describe '#get_xbox_one_games' do
      it 'returns all the xbox one games that the user has played' do
        game = Game.new(name: 'So Many Me',
                        id: 16468936,
                        last_unlock_time: '2015-07-25T13:16:50.2887979Z',
                        platform: Game::Type::XBOX_ONE,
                        current_achievements: 1,
                        current_gamerscore: 10,
                        total_gamerscore: 1000)
        expect(api.get_xbox_one_games).to match_array [game]
      end
    end

    describe '#get_xbox_360_games' do
      it 'returns all the xbox 360 games that the user has played' do
        game = Game.new(name: 'RISK Factions',
                        id: 1480657427,
                        last_unlock_time: '2015-07-25T13:38:37.2170000Z',
                        platform: Game::Type::XBOX_360,
                        current_achievements: 1,
                        current_gamerscore: 5,
                        total_gamerscore: 200)
        expect(api.get_xbox_360_games).to match_array [game]
      end
    end
  end
end