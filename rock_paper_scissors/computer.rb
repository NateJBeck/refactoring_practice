class Computer
  def make_a_move
    Game::CHOICES.sample.upcase
  end

  def cheat(player_move)
    Game::COMBOS[player_move]
  end

  def cheat_but_lose(player_move)
    Game::COMBOS.invert[player_move]
  end
end
