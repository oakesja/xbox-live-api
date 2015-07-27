require 'kernel'
require 'xbox_live_api/requests/login'
require 'xbox_live_api/requests/profile_request'
require 'xbox_live_api/requests/xbox_one_games_request'
require 'xbox_live_api/requests/xbox_360_games_request'
require 'xbox_live_api/requests/achievements/achievement_request'

class XboxLiveApi

  def self.login(email, password)
    request_info = Login.new(email, password).go
    XboxLiveApi.new(request_info)
  end

  def get_profile
    ProfileRequest.new(@request_info.authorization_header).for(@request_info.user_id)
  end

  def get_xbox_one_games
    XboxOneGamesRequest.new(@request_info.authorization_header).for(@request_info.user_id)
  end

  def get_xbox_360_games
    Xbox360GamesRequest.new(@request_info.authorization_header).for(@request_info.user_id)
  end

  def get_achievements_for(game)
    AchievementRequest.new(@request_info.authorization_header).for(@request_info.user_id, game)
  end

  private

  def initialize(request_info)
    @request_info = request_info
  end
end
