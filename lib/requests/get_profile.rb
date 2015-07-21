class GetProfile
  class << self
    def for(user_id, auth_header)
      url = 'https://profile.xboxlive.com/users/batch/profile/settings'
      header = {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'Authorization' => auth_header,
          'x-xbl-contract-version' => 2
      }
      params = {
          'settings' => ['Gamerscore', 'Gamertag'],
          'userIds' => [user_id]
      }
      HttpSessionGateway.new.post_json(url, header: header, body: params).body
    end
  end
end