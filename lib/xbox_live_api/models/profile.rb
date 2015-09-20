class XboxLiveApi
  class Profile

    # @return [Fixnum] the user's Xbox Live id
    attr_reader :id
    # @return [String] the user's Xbox Live gamertag
    attr_reader :gamertag
    # @return [Fixnum] the user's total gamerscore earned
    attr_reader :gamerscore
    # @return [String] a url to the user's gamer picture on xbox.com
    attr_reader :gamer_picture
    # @return [String] "Silver" or "Gold"
    attr_reader :account_tier
    # @return [String] "Good Player", etc.
    attr_reader :xbox_one_rep
    # @return [String] a url to retrieve the user's preferred colors
    attr_reader :preferred_color_url
    # @return [Fixnum] the number of years the user has been on Xbox Live
    attr_reader :tenure_level

    def initialize(id: nil, gamertag: nil, gamerscore: nil, gamer_picture: nil, account_tier: nil,
                   xbox_one_rep: nil, preferred_color_url: nil, tenure_level: nil)
      @id = id
      @gamertag = gamertag
      @gamerscore = gamerscore
      @gamer_picture = gamer_picture
      @account_tier = account_tier
      @xbox_one_rep = xbox_one_rep
      @preferred_color_url = preferred_color_url
      @tenure_level = tenure_level
    end

    def ==(o)
      o.instance_of?(self.class) && o.state == state
    end

    def hash
      state.hash
    end

    protected

    def state
      [@id, @gamertag, @gamerscore, @gamer_picture, @account_tier,
       @xbox_one_rep, @preferred_color_url, @tenure_level]
    end
  end
end