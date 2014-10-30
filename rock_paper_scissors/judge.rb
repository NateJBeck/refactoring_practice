class Judge
  def initialize(player, computer)
      @player = player
      @computer = computer
      @combos = Game::COMBOS
      @player_wins = 0
  end

  def announce_winner
    if is_tie?
      "TIE"
    else
      find_winner
    end
  end

  def player_wins
    @player_wins
  end

  private

  def is_tie?
    @player == @computer
  end

  def find_winner
    if @combos[@computer] == @player
      @player_wins += 1
      "Player wins!"
    else
      "Computer Wins!"
    end
  end
end
