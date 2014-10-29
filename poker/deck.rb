require './card.rb'

class Deck
  def initialize
    @suits = ["D", "S", "H", "C"]
    @values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

    @whole_deck = []
  end

  def create
    @values.each do |val|
      @suits.each do |suit|
        card = Card.new(suit, val)
        @whole_deck << card
      end
    end
  end

  def shuffle
    @whole_deck.shuffle!
  end

  def grab_five_cards
    @whole_deck.shift(5)
  end

end
