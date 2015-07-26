require 'requests/achievements/achievement_request'
require 'models/game'
require 'builders/game_builder'

describe AchievementRequest do
  let(:auth_header) { '1234' }
  let(:subject) { AchievementRequest.new(auth_header) }
  let(:user_id) { 1234 }
  let(:game) { GameBuilder.build(platform: platform) }
  let(:request) { double }

  describe '#for' do
    before(:each) do
      expect(request).to receive(:for).with(user_id, game)
    end
    context 'for an xbox one game' do
      let(:platform) { Game::Platform::XBOX_ONE }

      it 'makes a request for xbox one achievements' do
        expect(XboxOneAchievementRequest).to receive(:new).with(auth_header) { request }
        subject.for(user_id, game)
      end
    end

    context 'for an xbox 360 game' do
      let(:platform) { Game::Platform::XBOX_360 }

      it 'makes a request for xbox 360 achievements' do
        expect(Xbox360AchievementRequest).to receive(:new).with(auth_header) { request }
        subject.for(user_id, game)
      end
    end
  end
end