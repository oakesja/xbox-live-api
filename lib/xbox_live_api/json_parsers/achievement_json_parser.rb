require 'xbox_live_api/achievement'
require 'oj'

class XboxLiveApi
  module JsonParsers
    class AchievementJsonParser

      def parse_achievements_from(json_string)
        json = parse_json_string(json_string)
        ensure_valid_achievement_json(json)
        json['achievements'].collect do |achievement_json|
          Achievement.new(name: name_from(achievement_json),
                          id: id_from(achievement_json),
                          is_unlocked: is_unlocked_from(achievement_json),
                          icon_url: icon_url_from(achievement_json),
                          is_secret: is_secret_from(achievement_json),
                          unlocked_description: unlocked_description_from(achievement_json),
                          locked_description: locked_description_from(achievement_json),
                          value: value_from(achievement_json),
                          time_unlocked: time_unlocked_from(achievement_json))
        end
      end

      private

      def parse_json_string(json_string)
        Oj.load(json_string)
      end

      def ensure_valid_achievement_json(json)
        raise 'Achievement response is invalid' if json.nil?
        raise 'Achievement json response is missing the achievement section' unless json.has_key?('achievements')
      end

      def name_from(achievement_json)
        raise NotImplementedError
      end

      def id_from(achievement_json)
        raise NotImplementedError
      end

      def is_unlocked_from(achievement_json)
        raise NotImplementedError
      end

      def icon_url_from(achievement_json)
        raise NotImplementedError
      end

      def is_secret_from(achievement_json)
        raise NotImplementedError
      end

      def unlocked_description_from(achievement_json)
        raise NotImplementedError
      end

      def locked_description_from(achievement_json)
        raise NotImplementedError
      end

      def value_from(achievement_json)
        raise NotImplementedError
      end

      def time_unlocked_from(achievement_json)
        raise NotImplementedError
      end
    end
  end
end