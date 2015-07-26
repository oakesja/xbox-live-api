require 'models/common/my_comparable'

class Achievement < MyComparable
  attr_reader :name, :id, :is_unlocked, :icon_url, :is_secret, :unlocked_description,
              :locked_description, :value, :time_unlocked

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

  protected

  def state
    [@name, @id, @is_unlocked, @icon_url, @is_secret, @unlocked_description,
     @locked_description, @value, @time_unlocked]
  end
end