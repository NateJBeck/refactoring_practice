class Card
  def initialize(suit, val)
    @suit = suit
    @val = val
  end

  attr_reader :suit, :val

  def to_s
    "#{@val} #{@suit}"
  end
end
