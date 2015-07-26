require 'xbox_live_api/models/game'

class GameBuilder
  class << self
    def build(opts = {})
      XboxLiveApi::Game.new(attributes.merge(opts))
    end

    private

    def attributes
      {
          name: 'RISK Factions',
          id: 1480657427,
          last_unlock_time: '2015-07-25T13:38:37.2170000Z',
          platform: XboxLiveApi::Game::Platform::XBOX_360,
          current_achievements: 1,
          current_gamerscore: 5,
          total_gamerscore: 200
      }
    end
  end
end