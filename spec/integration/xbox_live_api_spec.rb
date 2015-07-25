require 'xbox_live_api'
require 'models/game'
require 'models/achievement'

describe XboxLiveApi do
  let(:email) { 'xb0xliveapi@hotmail.com' }
  let(:password) { '9UXxCGkAUfRtp3QT' }
  let(:subject) { XboxLiveApi.new }
  let(:xbox_360_game) do
    Game.new(name: 'RISK Factions',
             id: 1480657427,
             last_unlock_time: '2015-07-25T13:38:37.2170000Z',
             platform: Game::Type::XBOX_360,
             current_achievements: 1,
             current_gamerscore: 5,
             total_gamerscore: 200)
  end
  let(:xbox_one_game) do
    Game.new(name: 'So Many Me',
             id: 16468936,
             last_unlock_time: '2015-07-25T13:16:50.2887979Z',
             platform: Game::Type::XBOX_ONE,
             current_achievements: 1,
             current_gamerscore: 10,
             total_gamerscore: 1000)
  end

  describe '#login' do
    it 'will log a user in with the specified email and password' do
      expect { subject.login(email, password) }.to_not raise_error
    end
  end
  context 'after a user has been logged in' do
    before(:each) do
      subject.login(email, password)
    end

    describe '#get_profile' do
      it 'returns the profile information for the user' do
        profile = {
            id: '2535458020453936',
            gamerTag: 'AssuredSteam271',
            gamerScore: 15
        }
        expect(subject.get_profile).to eql profile
      end
    end

    describe '#get_xbox_one_games' do
      it 'returns all the xbox one games that the user has played' do
        expect(subject.get_xbox_one_games).to match_array [xbox_one_game]
      end
    end

    describe '#get_xbox_360_games' do
      it 'returns all the xbox 360 games that the user has played' do
        expect(subject.get_xbox_360_games).to match_array [xbox_360_game]
      end
    end

    describe '#get_achievements_for' do
      context 'given an xbox one game' do
        it 'returns the user\'s achievements for that game' do
          icon_url = 'http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToAsag2aUdBB_tYRcTKfuaeBqdlGVvgIOKcRmwkfmrRzYvppDOaoY8pHMF7oec5726VV7hz547z9KJ6tEVyB_vzOaP4coqj7vtiww_HULr4SmKYqie5c8Hl0rOp4ajonyPUN.Aaza4cNZFlzexYcHmrX'
          description = 'Acquire the first ME'
          achievement = Achievement.new(name: 'Yes, I\'m ME too!',
                                        id: 1,
                                        is_unlocked: true,
                                        icon_url: icon_url,
                                        is_secret: false,
                                        unlocked_description: description,
                                        locked_description: description,
                                        value: 10)
          achievements = subject.get_achievements_for(xbox_one_game)
          expect(achievements.size).to be 21
          expect(achievements).to include achievement
        end
      end
    end
  end
end