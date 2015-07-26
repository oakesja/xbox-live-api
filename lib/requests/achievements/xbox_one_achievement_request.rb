require 'requests/base_request'
require 'http_session_gateway'
require 'json_parser/achievements/xbox_one_achievement_json_parser'

class XboxOneAchievementRequest < BaseRequest

  def for(user_id, game)
    url = "https://achievements.xboxlive.com/users/xuid(#{user_id})/achievements?titleId=#{game.id}"
    json = HttpSessionGateway.new.get(url, header: header_for_version(Version::XBOX_ONE)).body
    XboxOneAchievementJsonParser.new.parse_achievements_from(json)
  end
end