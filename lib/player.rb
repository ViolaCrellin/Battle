

class Player
  attr_reader :name, :hp, :hp_range

  STARTING_HP = 100

  def initialize(name, hp=STARTING_HP)
    @name = name
    @hp = hp
  end

  def receive_damage
    @hp -= Kernel.rand(20)
  end



end
