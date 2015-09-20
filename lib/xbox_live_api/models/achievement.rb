class XboxLiveApi
  class Achievement

    # @return [String] the name of the achievement
    attr_reader :name
    # @return [Fixnum] a unique identifier
    attr_reader :id
    # @return [Boolean] true if the achievement has been unlocked by the player
    attr_reader :is_unlocked
    # @return [String] the url for icon on xbox.com
    attr_reader :icon_url
    # @return [Boolean] true if the achievement is secret
    attr_reader :is_secret
    # @return [String] the description to be used when the achievement is unlocked
    attr_reader :unlocked_description
    # @return [String] the description to be used when the achievement is locked
    attr_reader :locked_description
    # @return [Fixnum] the gamescore value awarded for unlocking this achievement
    attr_reader :value
    # @return [String] the date the achievement was unlocked. The formatting is dependent
    #     on the actual xbox live api. Xbox 360 achievements have the form "2015-07-25T13:55:01.5300000Z".
    #     Xbox one achievements have the form "2015-07-25T13:16:50.2887979Z".
    attr_reader :time_unlocked

    def initialize(name: nil, id: nil, is_unlocked: nil, icon_url: nil, is_secret: nil,
                   unlocked_description: nil, locked_description: nil, value: nil,
                   time_unlocked: nil)
      @name = name
      @id = id
      @is_unlocked = is_unlocked
      @icon_url = icon_url
      @is_secret = is_secret
      @unlocked_description = unlocked_description
      @locked_description = locked_description
      @value = value
      @time_unlocked = time_unlocked
    end

    def ==(o)
      o.instance_of?(self.class) && o.state == state
    end

    def hash
      state.hash
    end

    protected

    def state
      [@name, @id, @is_unlocked, @icon_url, @is_secret, @unlocked_description,
       @locked_description, @value, @time_unlocked]
    end
  end
end