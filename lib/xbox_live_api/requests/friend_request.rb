require 'oj'
require 'xbox_live_api/requests/base_request'

class XboxLiveApi
  module Requests
    class FriendRequest < BaseRequest

      def for(user_id)
        url = "https://social.xboxlive.com/users/xuid(#{user_id})/people"
        resp = HttpSessionGateway.new.get(url, header: header_for_version(Version::XBOX_ONE)).body
        json = Oj.load(resp)
        ids = json['people'].collect { |x| x['xuid'] }
        ids.map { |id| ProfileRequest.new(@auth_header).for(id) }
      end
    end
  end
end