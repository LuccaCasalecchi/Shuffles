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