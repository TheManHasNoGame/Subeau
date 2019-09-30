class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end
end

class Deck
  def initialize
    @ranks = [*(2..10), 'J', 'Q', 'K', 'A']
    @suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
    @cards = []

    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
      @cards.shift.output_card
  end

end

deck= Deck.new
deck.shuffle
deck.deal