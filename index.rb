class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    color = @suit == '♥️' || @suit == '♦️' ? "\e[31m" : ""
    "#{color}#{rank} of #{suit}\e[0m"
  end
end

class Standard_Deck
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

def user_interaction
  deck = Standard_Deck.new
  puts "Deseja realizar um faro Shuffle na ordem original?"
  choice = gets.chomp.downcase

  if choice == "sim"
    puts "Quantas vezes deseja realizar o embaralhamento?"
		number_of_shuffles = gets.chomp.to_i
		deck.repeat_faro_shuffle_out(number_of_shuffles)
  end

  deck
end

deck = user_interaction
puts "Standard Deck display:"
puts deck.to_s
