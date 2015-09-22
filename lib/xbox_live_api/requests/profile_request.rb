require 'xbox_live_api/requests/base_request'
require 'xbox_live_api/profile'
require 'oj'

class XboxLiveApi
  module Requests
    class ProfileRequest < BaseRequest

      def for(user_id)
        resp = make_request(user_id)
        handle_response(resp, user_id)
      end

      private

      def make_request(user_id)
        url = 'https://profile.xboxlive.com/users/batch/profile/settings'
        params = {
            'settings' => %w(Gamerscore Gamertag GameDisplayPicRaw AccountTier XboxOneRep PreferredColor TenureLevel),
            'userIds' => [user_id]
        }
        HttpSessionGateway.new.post_json(url, header: header_for_version(Version::XBOX_ONE), body: params).body
      end

      def handle_response(resp, user_id)
        json = Oj.load(resp)
        settings = json['profileUsers'].first['settings']
        settings_hash = collect_settings(settings)
        Profile.new(id: user_id,
                    gamertag: settings_hash['Gamertag'],
                    gamerscore: settings_hash['Gamerscore'].to_i,
                    gamer_picture: settings_hash['GameDisplayPicRaw'],
                    account_tier: settings_hash['AccountTier'],
                    xbox_one_rep: settings_hash['XboxOneRep'],
                    preferred_color_url: settings_hash['PreferredColor'],
                    tenure_level: settings_hash['TenureLevel'].to_i)
      end

      def collect_settings(settings)
        settings_hash = {}
        settings.each do |setting|
          settings_hash.store(setting['id'], setting['value'])
        end
        settings_hash
      end
    end
  end
end