require 'requests/base_request'
require 'http_session_gateway'
require 'oj'
require 'models/achievement'

class AchievementRequest < BaseRequest

  def for(user_id, game)
    url = "https://achievements.xboxlive.com/users/xuid(#{user_id})/achievements?titleId=#{game.id}&orderBy=EndingSoon"
    json = HttpSessionGateway.new.get_json(url, header: header_for_version(2)).body
    json['achievements'].collect do |achievement_json|
      Achievement.new(name: achievement_json['name'],
                      id: achievement_json['id'].to_i,
                      is_unlocked: achievement_json['progressState'] == 'Achieved',
                      icon_url: achievement_json['mediaAssets'][0]['url'],
                      is_secret: achievement_json['isSecret'],
                      unlocked_description: achievement_json['description'],
                      locked_description: achievement_json['lockedDescription'],
                      value: achievement_json['rewards'][0]['value'].to_i)
    end
  end
end