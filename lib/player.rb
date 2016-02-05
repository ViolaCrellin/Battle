

class Player
  attr_reader :name, :hp, :hp_range

  STARTING_HP = 100

  def initialize(name, hp=STARTING_HP)
    @name = name
    @hp = hp
    @alive = true
  end

  def receive_damage
    if alive?
      @hp -= Kernel.rand(20)
    else
      @hp = 0
    end
  end

  def alive?
    hp >= 0
  end

  def dead?
    hp <= 0
  end


end
