class Game

  attr_reader :p1, :p2, :turn

  def initialize(player_1, player_2)
    @p1 = player_1
    @p2 = player_2
    @turn = 0
  end

  def player_one_attacks
    if turn.even?
      p2.receive_damage
      @turn += 1
    else
      @turn = 1
    end
  end

  def player_two_attacks
    if turn.odd?
      p1.receive_damage
      @turn += 1
    else
      @turn = 0
    end
  end


  def somebody_won?
    (p1.hp - 10) == 0 || (p2.hp - 10) == 0
  end

end
