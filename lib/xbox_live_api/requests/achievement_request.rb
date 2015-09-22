require 'xbox_live_api/requests/base_request'
require 'xbox_live_api/requests/xbox_one_achievement_request'
require 'xbox_live_api/requests/xbox_360_achievement_request'
require 'xbox_live_api/game'

class XboxLiveApi
  module Requests
    class AchievementRequest < BaseRequest

      def for(user_id, game)
        request = game.platform == Game::Platform::XBOX_ONE ? XboxOneAchievementRequest : Xbox360AchievementRequest
        request.new(@auth_header).for(user_id, game)
      end
    end
  end
end