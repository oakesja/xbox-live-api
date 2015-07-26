require 'requests/base_request'
require 'models/profile'

class ProfileRequest < BaseRequest

  def for(user_id)
    url = 'https://profile.xboxlive.com/users/batch/profile/settings'
    params = {
        'settings' => %w(Gamerscore Gamertag GameDisplayPicRaw AccountTier XboxOneRep PreferredColor TenureLevel),
        'userIds' => [user_id]
    }
    resp = HttpSessionGateway.new.post_json(url, header: header_for_version(Version::XBOX_ONE), body: params).body
    json = Oj.load(resp)
    settings = json['profileUsers'].first['settings']
    settings_hash = {}
    settings.each do |setting|
      settings_hash.store(setting['id'], setting['value'])
    end
    Profile.new(id: user_id,
                gamertag: settings_hash['Gamertag'],
                gamerscore: settings_hash['Gamerscore'].to_i,
                gamer_picture: settings_hash['GameDisplayPicRaw'],
                account_tier: settings_hash['AccountTier'],
                xbox_one_rep: settings_hash['XboxOneRep'],
                preferred_color_url: settings_hash['PreferredColor'],
                tenure_level: settings_hash['TenureLevel'].to_i)
  end
end