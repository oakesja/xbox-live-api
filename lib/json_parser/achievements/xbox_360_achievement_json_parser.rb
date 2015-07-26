require 'json_parser/achievements/achievement_json_parser'

class Xbox360AchievementJsonParser < AchievementJsonParser

  private

  def name_from(achievement_json)
    achievement_json['name']
  end

  def id_from(achievement_json)
    achievement_json['id'].to_i
  end

  def is_unlocked_from(achievement_json)
    achievement_json['unlocked']
  end

  def icon_url_from(achievement_json)
    title_id = achievement_json['titleId']
    image_id = achievement_json['imageId']
    "http://image.xboxlive.com/global/t.#{title_id.to_s(16)}/ach/0/#{image_id.to_s(16)}"
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
    achievement_json['gamerscore']
  end
end