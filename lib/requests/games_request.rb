require 'requests/base_request'
require 'oj'
require 'http_session_gateway'

class GamesRequest < BaseRequest
  class Version
    XBOX_360 = 1
    XBOX_ONE = 2
  end

  def get_request_json(user_id, version)
    url = "https://achievements.xboxlive.com/users/xuid(#{user_id})/history/titles?orderBy=unlockTime"
    resp = HttpSessionGateway.new.get(url, header: header_for_version(version)).body
    Oj.load(resp)
  end
end