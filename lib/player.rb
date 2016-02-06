

class Player
  attr_reader :name, :hp, :random_damage

  STARTING_HP = 100

  def initialize(name, hp=STARTING_HP)
    @name = name
    @hp = hp
  end

  def random_damage
    Kernel.rand(20)
  end

  def receive_damage
    @random_damage = random_damage
    if alive?
      @hp -= @random_damage
    else
      @hp = 0
    end
  end

  def alive?
    hp - random_damage >= 0
  end

  def dead?
    hp - random_damage <= 0
  end


end
