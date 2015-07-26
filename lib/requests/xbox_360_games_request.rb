require 'requests/games_request'

class Xbox360GamesRequest < GamesRequest

  def for(user_id)
    games = get_game_list_json(user_id, Version::XBOX_360)
    games.collect do |game|
      Game.new(name: game['name'],
               id: game['titleId'],
               last_unlock_time: game['lastPlayed'],
               platform: Game::Platform::XBOX_360,
               current_achievements: game['currentAchievements'],
               current_gamerscore: game['currentGamerscore'],
               total_gamerscore: game['totalGamerscore'])
    end
  end
end