class XboxLiveApi
  class RequestInfo
    attr_reader :user_id, :gamertag, :token

    def initialize(user_id: nil, gamertag: nil, token: nil)
      @user_id = user_id
      @gamertag = gamertag
      @token = token
    end
  end
end