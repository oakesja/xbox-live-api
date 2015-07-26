require 'requests/base_request'
require 'oj'
require 'http_session_gateway'

class GamesRequest < BaseRequest

  def get_game_list_json(user_id, version)
    url = "https://achievements.xboxlive.com/users/xuid(#{user_id})/history/titles?orderBy=unlockTime"
    resp = HttpSessionGateway.new.get(url, header: header_for_version(version)).body
    json = Oj.load(resp)
    json['titles']
  end
end