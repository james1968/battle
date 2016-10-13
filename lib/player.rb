class Player
  DEFAULT_HITPOINTS = 60
  attr_reader :name, :hit_points


  def initialize(name, hitpoints=DEFAULT_HITPOINTS)
    @name = name
    @hit_points = hitpoints
  end


  def reduce_health
    @hit_points -= chance
  end

  def chance
    rand(0..@hit_points)
  end

end
