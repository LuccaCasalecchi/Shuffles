require 'tty-prompt'
require_relative 'Decks/StandardDeck'
require_relative 'Decks/Mnemonica'

def user_interaction
  prompt = TTY::Prompt.new

  deck_choice = prompt.select("Qual stack você deseja usar?", { "Standard" => 1, "Tamariz" => 2 })
  
  deck = case deck_choice
          when 1
            StandardDeck.new
          when 2
            Mnemonica.new
          end


  if prompt.yes?("Deseja realizar um faro Shuffle out na ordem original?")
    number_of_shuffles = prompt.ask("Quantas vezes deseja realizar o embaralhamento?", convert: :int)
    deck.repeat_faro_shuffle_out(number_of_shuffles)
  end

  deck
end

deck = user_interaction
puts "Deck display:"
puts deck.to_s
