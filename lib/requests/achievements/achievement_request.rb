require 'requests/base_request'
require 'requests/achievements/xbox_one_achievement_request'
require 'requests/achievements/xbox_360_achievement_request'
require 'models/game'

class AchievementRequest < BaseRequest

  def for(user_id, game)
    request = game.platform == Game::Platform::XBOX_ONE ? XboxOneAchievementRequest : Xbox360AchievementRequest
    request.new(@auth_header).for(user_id, game)
  end
end