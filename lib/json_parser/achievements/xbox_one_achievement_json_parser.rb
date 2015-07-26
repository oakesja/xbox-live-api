require 'json_parser/achievements/achievement_json_parser'

class XboxOneAchievementJsonParser < AchievementJsonParser

  private

  def name_from(achievement_json)
    achievement_json['name']
  end

  def id_from(achievement_json)
    achievement_json['id'].to_i
  end

  def is_unlocked_from(achievement_json)
    achievement_json['progressState'] == 'Achieved'
  end

  def icon_url_from(achievement_json)
    achievement_json['mediaAssets'][0]['url']
  end

  def is_secret_from(achievement_json)
    achievement_json['isSecret']
  end

  def unlocked_description_from(achievement_json)
    achievement_json['description']
  end

  def locked_description_from(achievement_json)
    achievement_json['lockedDescription']
  end

  def value_from(achievement_json)
    achievement_json['rewards'][0]['value'].to_i
  end
end