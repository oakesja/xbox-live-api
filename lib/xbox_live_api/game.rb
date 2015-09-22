class XboxLiveApi
  class Game
    class Platform
      XBOX_360 = '360'
      XBOX_ONE = '720'
    end

    # @return [Fixnum] the name of the game
    attr_reader :name
    # @return [Fixnum] the unique Xbox Live id of the game
    attr_reader :id
    # TODO last_unlock_time
    attr_reader :last_unlock_time
    # @return [XboxLiveApi::Game::Platform::Xbox_360, XboxLiveApi::Game::Platform::Xbox_One]
    attr_reader :platform
    # @return [Fixnum] the number of achievements the user has unlocked for this game
    attr_reader :current_achievements
    # @return [Fixnum] the number of gamerscore the user has earned for this game
    attr_reader :current_gamerscore
    # @return [Fixnum] the total number of gamerscore the user can earn for this game
    attr_reader :total_gamerscore

    def initialize(name: nil, id: nil, last_unlock_time: nil, platform: nil, current_achievements: nil,
                   current_gamerscore: nil, total_gamerscore: nil)
      @name = name
      @id = id
      @last_unlock_time = last_unlock_time
      @platform = platform
      @current_achievements = current_achievements
      @current_gamerscore = current_gamerscore
      @total_gamerscore = total_gamerscore
    end

    def ==(o)
      o.instance_of?(self.class) && o.state == state
    end

    def hash
      state.hash
    end

    protected

    def state
      [@name, @id, @last_unlock_time, @platform, @current_achievements,
       @current_gamerscore, @total_gamerscore]
    end
  end
end