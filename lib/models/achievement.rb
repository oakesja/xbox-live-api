require 'models/common/my_comparable'

class Achievement < MyComparable
  attr_reader :name, :id, :is_unlocked, :icon_url, :is_secret, :unlocked_description,
              :locked_description, :value

  def initialize(name: nil, id: nil, is_unlocked: nil, icon_url: nil, is_secret: nil,
                 unlocked_description: nil, locked_description: nil, value: nil)
    @name = name
    @id = id
    @is_unlocked = is_unlocked
    @icon_url = icon_url
    @is_secret = is_secret
    @unlocked_description = unlocked_description
    @locked_description = locked_description
    @value = value
  end

  protected

  def state
    [@name, @id, @is_unlocked, @icon_url, @is_secret, @unlocked_description,
     @locked_description, @value]
  end
end