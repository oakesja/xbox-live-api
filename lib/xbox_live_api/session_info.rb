class XboxLiveApi
  class SessionInfo

    # @return [Fixnum] the xbox live id for the logged in user
    attr_reader :user_id
    # @return [String] the xbox live gamertag for the logged in user
    attr_reader :gamertag
    # @return [String] the xbox live token used to make requests for the logged in user
    attr_reader :token

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