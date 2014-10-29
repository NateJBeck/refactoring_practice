require './deck.rb'
require './evaluation.rb'

class Game
  NUMBER_PLAYERS = 4

  def prep_deck
    @deck = Deck.new
    @deck.create
    @deck.shuffle
  end

  def deal
    @players = (1..NUMBER_PLAYERS).map do
      @deck.grab_five_cards
    end
  end

  def show_player_cards
    @players.each_with_index do |hand, index|
      puts "Player #{index + 1}"
      puts hand

      print_hand_value(hand)
      puts
    end
  end

  def print_hand_value(hand)
    evaluation = Evaluation.new(hand)
    value = evaluation.value
    puts value
  end

end

game = Game.new
game.prep_deck
game.deal
game.show_player_cards
