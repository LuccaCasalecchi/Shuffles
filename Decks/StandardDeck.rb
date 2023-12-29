require_relative '../Card/Card'

class StandardDeck
    RANKS = ['K', 'Q', 'J', 10, 9, 8, 7, 6, 5, 4, 3, 2, 'A']
    SUITS = ['♥️', '♦️', '♣️', '♠️']
  
    def initialize
      new_deck_order
    end
  
    def new_deck_order
      @cards = []
      SUITS.each do |suit|
        RANKS.each do |rank|
          @cards << Card.new(rank, suit)
        end
      end
    end
  
    def faro_shuffle_out
      half = (@cards.size / 2.0).round
      first_half = @cards.take(half)
      second_half = @cards.drop(half)
  
      shuffled = []
      first_half.zip(second_half).each do |first, second|
        shuffled.push(first)
        shuffled.push(second) if second
      end
  
      @cards = shuffled
    end
  
      def repeat_faro_shuffle_out(n)
          n.times{faro_shuffle_out}
      end
  
    def to_s
      @cards.each_slice(13).map { |slice| slice.join(", ") }.join("\n")
    end
  end