require_relative 'StandardDeck'
require_relative '../Card/Card'

class Mnemonica < StandardDeck
    MnemonicaOrder = ['4♣️', '2♥️', '7♦️', '3♣️', '4♥️', '6♦️', 'A♠️', '5♥️', '9♠️', '2♠️', 'Q♥️', '3♦️', 'Q♣️', '8♥️',
    '6♠️', '5♠️', '9♥️', 'K♣️', '2♦️', 'J♥️', '3♠️', '8♠️', '6♥️', '10♣️', '5♦️', 'K♦️', '2♣️', '3♥️',
    '8♦️', '5♣️', 'K♠️', 'J♦️', '8♣️', '10♠️', 'K♥️', 'J♣️', '7♠️', '10♥️', 'A♦️', '4♠️', '7♥️', '4♦️',
    'A♣️', '9♣️', 'J♠️', 'Q♦️', '7♣️', 'Q♠️', '10♦️', '6♣️', 'A♥️', '9♦️']

    def initialize
        tamariz_deck_order
    end

    
    def tamariz_deck_order
        @cards = MnemonicaOrder.map do |code|
          suit_symbol = code.match(/[♣️♦️♥️♠️]+/).to_s
          rank = code.sub(suit_symbol, '')
          Card.new(rank, suit_symbol)
        end
      end
end

