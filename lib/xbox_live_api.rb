require 'kernel'
require 'xbox_live_api/requests/login'
require 'xbox_live_api/requests/profile_request'
require 'xbox_live_api/requests/xbox_one_games_request'
require 'xbox_live_api/requests/xbox_360_games_request'
require 'xbox_live_api/requests/achievements/achievement_request'

class XboxLiveApi
  attr_reader :session_info

  def self.login(email, password)
    session_info = Login.new(email, password).execute
    XboxLiveApi.new(session_info)
  end

  def self.with_session_info(session_info)
    XboxLiveApi.new(session_info)
  end

  def get_profile
    ProfileRequest.new(@session_info.token).for(@session_info.user_id)
  end

  # def get_profile_with_id
  #
  # end
  #
  # def get_profile_with_gamertag
  #
  # end

  def get_xbox_one_games
    XboxOneGamesRequest.new(@session_info.token).for(@session_info.user_id)
  end

  def get_xbox_360_games
    Xbox360GamesRequest.new(@session_info.token).for(@session_info.user_id)
  end

  def get_achievements_for(game)
    AchievementRequest.new(@session_info.token).for(@session_info.user_id, game)
  end

  private

  def initialize(session_info)
    @session_info = session_info
  end
end
