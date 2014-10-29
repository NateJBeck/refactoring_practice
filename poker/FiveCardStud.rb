require './deck.rb'

class Game
  NUMBER_PLAYERS = 4

  def initialize
    @players = [[],[],[],[]]
    @players = Array.new(5) {Array.new(5,nil)}
  end

  def prep_deck
    @deck = Deck.new
    @deck.create
    @deck.shuffle
  end

  def deal
    NUMBER_PLAYERS.times do |num|
      @players[num] = []
      @players[num] << @deck.grab_five_cards
    end

    print_player_cards
  end

  def print_player_cards
    NUMBER_PLAYERS.times do |num|
      puts @players[num]
    end
  end

end

game = Game.new
game.prep_deck
game.deal
