require 'requests/games_request'

class Xbox360GamesRequest < GamesRequest

  def for(user_id)
    json = get_request_json(user_id, GamesRequest::Version::XBOX_360)
    json['titles'].collect do |game_json|
      Game.new(name: game_json['name'],
               id: game_json['titleId'],
               last_unlock_time: game_json['lastPlayed'],
               platform: Game::Type::XBOX_360,
               current_achievements: game_json['currentAchievements'],
               current_gamerscore: game_json['currentGamerscore'],
               total_gamerscore: game_json['totalGamerscore'])
    end
  end
end