class Card
	attr_reader :rank, :suit

	def initialize(rank,suit)
		@rank = rank
		@suit = suit
	end

	def to_s
		"#{rank} of #{suit}"
	end
end


class Deck
	RANKS = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
	SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

  def initialize
    @cards = []
    for suit in SUITS
      for rank in RANKS
        @cards << Card.new(rank, suit)
      end
    end
  end

=begin também poderia inicializar dessa forma:
  def initialize
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end
=end

	def to_s
		@cards.map{ |card| card.to_s }.join(", ")
	end
end

deck = Deck.new
puts deck
