require 'requests/base_request'
require 'http_session_gateway'
require 'json_parser/achievements/xbox_360_achievement_json_parser'


class Xbox360AchievementRequest < BaseRequest

  def for(user_id, game)
    url = "https://achievements.xboxlive.com/users/xuid(#{user_id})/achievements?titleId=#{game.id}"
    json = HttpSessionGateway.new.get(url, header: header_for_version(Version::XBOX_360)).body
    parser = Xbox360AchievementJsonParser.new
    unlocked = parser.parse_achievements_from(json)
    url = "https://achievements.xboxlive.com/users/xuid(#{user_id})/titleachievements?titleId=#{game.id}"
    json = HttpSessionGateway.new.get(url, header: header_for_version(2)).body
    locked = parser.parse_achievements_from(json)
    unlocked_ids = unlocked.collect(&:id)
    locked.reject! { |achievement| unlocked_ids.include?(achievement.id) }
    unlocked + locked
  end
end