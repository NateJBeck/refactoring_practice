class Judge
  def initialize(player, computer)
      @player = player
      @computer = computer
      @combos = Game::COMBOS
  end

  def announce_winner
    if is_tie?
      "TIE"
    else
      find_winner
    end
  end

  private

  def is_tie?
    @player == @computer
  end

  def find_winner
    if @combos[@computer] == @player
      "Player wins!"
    else
      "Computer Wins!"
    end
  end
end
