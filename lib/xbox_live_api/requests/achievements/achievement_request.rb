require 'xbox_live_api/requests/base_request'
require 'xbox_live_api/requests/achievements/xbox_one_achievement_request'
require 'xbox_live_api/requests/achievements/xbox_360_achievement_request'
require 'xbox_live_api/models/game'

class XboxLiveApi
  class AchievementRequest < BaseRequest

    def for(user_id, game)
      request = game.platform == Game::Platform::XBOX_ONE ? XboxOneAchievementRequest : Xbox360AchievementRequest
      request.new(@auth_header).for(user_id, game)
    end
  end
end