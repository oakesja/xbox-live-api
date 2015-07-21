require 'requests/games_request'

class XboxOneGamesRequest < GamesRequest

  def for(user_id)
    json = get_request_json(user_id, GamesRequest::Version::XBOX_ONE)
    json['titles'].collect do |game_json|
      Game.new(name: game_json['name'],
               id: game_json['titleId'],
               last_unlock_time: game_json['lastUnlock'],
               platform: Game::Type::XBOX_ONE,
               current_achievements: game_json['earnedAchievements'],
               current_gamerscore: game_json['currentGamerscore'],
               total_gamerscore: game_json['maxGamerscore'])
    end
  end
end