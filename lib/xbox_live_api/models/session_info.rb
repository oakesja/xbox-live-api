class XboxLiveApi
  class SessionInfo
    attr_reader :user_id, :gamertag, :token

    def initialize(user_id: nil, gamertag: nil, token: nil)
      @user_id = user_id
      @gamertag = gamertag
      @token = token
    end

    def ==(o)
      o.instance_of?(self.class) && o.state == state
    end

    def hash
      state.hash
    end

    protected

    def state
      [@user_id, @gamertag, @token]
    end
  end
end