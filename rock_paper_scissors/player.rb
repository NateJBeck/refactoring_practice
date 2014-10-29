class Player
  def make_a_move
    print "Make a move, punk >> "
    move = gets.chomp
    valid_move?(move)
  end

  private

  def valid_move?(move)
    if Game::CHOICES.include?(move.downcase)
      move
    else
      make_a_move
    end
  end
end
