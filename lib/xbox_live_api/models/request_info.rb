class XboxLiveApi
  class RequestInfo
    attr_reader :user_id, :gamertag, :authorization_header

    def initialize(user_id: nil, gamertag: nil, authorization_header: nil)
      @user_id = user_id
      @gamertag = gamertag
      @authorization_header = authorization_header
    end
  end
end