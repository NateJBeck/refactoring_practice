class Evaluation
  def initialize(hand)
    @hand = hand
    @values = []
    @suits = []

    get_suits_and_values
  end

  def get_suits_and_values
    @hand.length.times { |card_num| @values << @hand[card_num].val }
    @hand.length.times { |card_num| @suits << @hand[card_num].suit }
  end

  def value
  #  royal_flush? ||
      # straight_flush? ||
         four_of_kind? ||
           full_house? ||
             flush?  ||
  #             straight? ||
                three_of_kind? ||
                two_pair? ||
                    pair? ||
                      high_card?
  end

  def high_card?
    values = @values.sort.reverse
    if @values.detect { |val| val == "A" }
      "High Card Ace"
    elsif @values.detect { |val| val == "K" }
      "High Card King"
    elsif @values.detect { |val| val == "Q" }
      "High Card Queen"
    elsif @values.detect { |val| val == "J" } 
      "High Card Jack"
    else
      "High Card #{values.first}"
    end
  end

  def pair?
    if @values.detect { |val| @values.count(val) == 2 } then :pair end
  end

  def two_pair?
    values = @values.sort
    if (values[0] == values[1] && values[2] == values[3]) || (values[1] == values[2] && values[3] == values[4])
      :two_pair
    end
  end

  def three_of_kind?
    if @values.detect { |val| @values.count(val) == 3 } then :three_of_kind end
  end

  def four_of_kind?
    if @values.detect { |val| @values.count(val) == 4 } then :four_of_kind end
  end

  def flush?
    if @suits.detect { |suit| @suits.count(suit) == 5} then :flush end
  end

  def full_house?
    values = @values.sort
    if (values[0] == values[1] && values[1] == values[2]) && (values[3] == values[4])
      :full_house
    end
  end
end
