require 'kernel'
require 'oj'
require 'requests/login'
require 'requests/profile_request'
require 'requests/xbox_one_games_request'
require 'requests/xbox_360_games_request'
require 'requests/achievements/achievement_request'

class XboxLiveApi

  def login(email, password)
    @request_info = Login.new(email, password).go
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
end
