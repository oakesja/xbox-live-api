require 'spec_helper'

describe XboxLiveApi do
  let(:email) { 'xb0xliveapi@hotmail.com' }
  let(:password) { '9UXxCGkAUfRtp3QT' }
  let(:xbox_360_game) do
    XboxLiveApi::Game.new(name: 'RISK Factions',
                          id: 1480657427,
                          last_unlock_time: '2015-07-25T13:38:37.2170000Z',
                          platform: XboxLiveApi::Game::Platform::XBOX_360,
                          current_achievements: 1,
                          current_gamerscore: 5,
                          total_gamerscore: 200)
  end
  let(:xbox_one_game) do
    XboxLiveApi::Game.new(name: 'So Many Me',
                          id: 16468936,
                          last_unlock_time: '2015-07-25T13:16:50.2887979Z',
                          platform: XboxLiveApi::Game::Platform::XBOX_ONE,
                          current_achievements: 1,
                          current_gamerscore: 10,
                          total_gamerscore: 1000)
  end

  describe '.login' do
    it 'will log a user in with the specified email and password returning an instance of the api to use' do
      expect(XboxLiveApi.login(email, password)).to be_an_instance_of XboxLiveApi
    end
  end

  describe '.with_session_info' do
    let(:session_info) { XboxLiveApi.login(email, password).session_info }
    let(:subject) { XboxLiveApi.with_session_info(session_info) }
    it 'will bypass logging in by providing session info used from a prior login' do
      expect(subject.session_info).to eql session_info
    end
  end

  context 'after a user has been logged in' do
    let(:subject) { XboxLiveApi.login(email, password) }
    let(:friend_id) { '2533274912330216' }

    describe '#get_profile' do
      let(:gamer_picture) { 'http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToBrrCmIEEXHC9UNrdJ6P7KIU9bcRvGYJAQotfisIC8nP2R3gKqd4PBnjXV9fDp5BlAEiV273wAV8SJGKuIPGCfC&format=png' }
      let(:profile) do
        XboxLiveApi::Profile.new(id: '2535458020453936',
                                 gamertag: 'AssuredSteam271',
                                 gamerscore: 15,
                                 gamer_picture: gamer_picture,
                                 account_tier: 'Silver',
                                 xbox_one_rep: 'GoodPlayer',
                                 preferred_color_url: 'http://dlassets.xboxlive.com/public/content/ppl/colors/00000.json ',
                                 tenure_level: 0)
      end
      it 'returns the profile information for the user' do
        expect(subject.get_profile).to eq profile
      end
    end

    describe '#get_friends_ids' do
      it 'returns the list of friends for the user' do
        friends = subject.get_friend_ids
        expect(friends.length).to eql 1
        expect(friends.first.id).to eql friend_id
        expect(friends.first.gamertag).to eql 'PoizonOakes92'
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
        let(:icon_url) { 'http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToAsag2aUdBB_tYRcTKfuaeBqdlGVvgIOKcRmwkfmrRzYvppDOaoY8pHMF7oec5726VV7hz547z9KJ6tEVyB_vzOaP4coqj7vtiww_HULr4SmKYqie5c8Hl0rOp4ajonyPUN.Aaza4cNZFlzexYcHmrX' }
        let(:description) { 'Acquire the first ME' }
        let(:achievement) do
          XboxLiveApi::Achievement.new(name: 'Yes, I\'m ME too!',
                                       id: 1,
                                       is_unlocked: true,
                                       icon_url: icon_url,
                                       is_secret: false,
                                       unlocked_description: description,
                                       locked_description: description,
                                       value: 10,
                                       time_unlocked: '2015-07-25T13:16:50.2887979Z')
        end
        it 'returns the user\'s achievements for that game' do
          achievements = subject.get_achievements_for(xbox_one_game)
          expect(achievements).to be_an_instance_of Array
          expect(achievements.size).to be 21
          expect(achievements).to include achievement
        end
      end

      context 'given an xbox 360 game' do
        let(:achievement) do
          XboxLiveApi::Achievement.new(name: 'First Strike',
                                       id: 2,
                                       is_unlocked: true,
                                       icon_url: 'http://image.xboxlive.com/global/t.58410a13/ach/0/6',
                                       is_secret: false,
                                       unlocked_description: 'You got an objective before everyone else.',
                                       locked_description: 'Be the first to get an objective in game.',
                                       value: 5,
                                       time_unlocked: '2015-07-25T13:55:01.5300000Z')
        end
        it 'returns the user\'s achievements for that game' do
          achievements = subject.get_achievements_for(xbox_360_game)
          expect(achievements).to be_an_instance_of Array
          expect(achievements.size).to be 12
          expect(achievements).to include achievement
        end
      end
    end
  end
end