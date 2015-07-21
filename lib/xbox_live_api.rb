require 'kernel'
require 'oj'
require 'requests/login'
require 'requests/get_profile'
require 'requests/xbox_one_games_request'
require 'requests/get_xbox_360_games'

class XboxLiveApi

  def login(email, password)
    @request_info = Login.new(email, password).go
  end

  def get_profile
    resp = GetProfile.for(@request_info.user_id, @request_info.authorization_header)
    json = Oj.load(resp)
    {
        id: json['profileUsers'][0]['id'],
        gamerTag: json['profileUsers'][0]['settings'][1]['value'],
        gamerScore: json['profileUsers'][0]['settings'][0]['value'].to_i
    }
  end

  def get_xbox_one_games
    XboxOneGamesRequest.new(@request_info.authorization_header).for(@request_info.user_id)
  end

  def get_xbox_360_games
    Xbox360GamesRequest.new(@request_info.authorization_header).for(@request_info.user_id)
  end
end
