

class Player
  attr_reader :name, :hp, :random_hp

  STARTING_HP = 100

  def initialize(name, hp=STARTING_HP)
    @name = name
    @hp = hp
  end

  def random_damage
    @random_hp = Kernel.rand(20)
    random_hp
  end

  def receive_damage
    if alive?
      @hp -= @random_hp
    else
      @hp = 0
    end
  end

  def alive?
    hp - @random_hp >= 0
  end

  def dead?
    hp - random_damage < 0
  end


end
