require 'kernel'
require 'xbox_live_api/requests'

class XboxLiveApi

  # @return [XboxLiveApi::SessionInfo]
  attr_reader :session_info

  # Creates a new XboxLiveApi instance by logging in a user
  # @param email [String] Windows Live account email to use to login
  # @param password [String] associated password to use to login
  # @return [XboxLiveApi]
  # @example
  #   api = XboxLiveApi.login('example@example.com', 'password123')
  # @note Emails and passwords are not stored, logged, or otherwise used in any
  #   manner other than to securely login to Xbox Live
  def self.login(email, password)
    session_info = Requests::Login.new(email, password).execute
    XboxLiveApi.new(session_info)
  end

  # Creates a new XboxLiveApi instance with session info from a prior instance
  # @param session_info [XboxLiveApi::SessionInfo] session info from a prior XboxLiveApi instance
  # @return [XboxLiveApi]
  # @example
  #   api = XboxLiveApi.login('example@example.com', 'password123')
  #   api2 = XboxLiveApi.with_session_info(api.session_info)
  def self.with_session_info(session_info)
    XboxLiveApi.new(session_info)
  end

  # @return [XboxLiveApi::Profile] profile information for the current user
  def get_profile
    Requests::ProfileRequest.new(@session_info.token).for(@session_info.user_id)
  end

  # @return [Array<XboxLiveApi::Profile>] all friends' profiles for the current user
  def get_friend_ids
    Requests::FriendRequest.new(@session_info.token).for(@session_info.user_id)
  end

  # @return [Array<XboxLiveApi::Game>] list of Xbox one games played by the current user
  def get_xbox_one_games
    Requests::XboxOneGamesRequest.new(@session_info.token).for(@session_info.user_id)
  end

  # @return [Array<XboxLiveApi::Game>] list of Xbox 360 games played by the current user
  def get_xbox_360_games
    Requests::Xbox360GamesRequest.new(@session_info.token).for(@session_info.user_id)
  end

  # @param game [XboxLiveApi::Game] game to get achievements for
  # @return [Array<XboxLiveApi::Achievement>] list of Xbox achievements for the current user and the given game
  def get_achievements_for(game)
    Requests::AchievementRequest.new(@session_info.token).for(@session_info.user_id, game)
  end

  private

  def initialize(session_info)
    @session_info = session_info
  end
end
