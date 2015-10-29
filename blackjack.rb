# initialize deck
# ask player name
# deal player 2 cards
# deal dealer 2 cards

# PLAYER TURN
# if blackjack - player wins
# loop if sum of player cards < 21 ask "hit or stay"
#   if stay, dealers turn
#   if hit, deal one card
# end
# if sum of player cards = 21 player stays
# if sum of player cards > 21 player busts - dealer wins

# DEALER TURN
# if blackjack - dealer wins
#   loop if sum of dealer cards < 17 deal one card
#   if sum of cards > 21 dealer busts
#   else dealer stays

# if both players choose stay then compare total
#   greater total is the winner

# --------- METHODS ------------------

def get_player_name
  puts "Let's play some blackjack. What is your name?"
  player_name = gets.chomp
  sleep 1
  puts "Welcome #{player_name}, here we go."
end

def initialize_deck
  deck = {1 => ['AC', 'AS', 'AD', 'AH'], 
          2 => ['2C', '2S', '2D', '2H'], 
          3 => ['3C', '3S', '3D', '3H'], 
          4 => ['4C', '4S', '4D', '4H'],
          5 => ['5C', '5S', '5D', '5H'],
          6 => ['6C', '6S', '6D', '6H'],
          7 => ['7C', '7S', '7D', '7H'],
          8 => ['8C', '8S', '8D', '8H'],
          9 => ['9C', '9S', '9D', '9H'],
          10 => ['10C', '10S', '10D', '10H', 'JC', 'JS', 'JD', 'JH', 'QC', 'QS', 'QD', 'QH', 'KC', 'KS', 'KD', 'JH'],
        }
end

deck = initialize_deck

def available_cards(deck)  
  deck.values.flatten
end

def search_deck(card)
  deck.each do |number, card|
    return deck

def player_new_hand(deck)
  card1 = available_cards(deck).sample
  card2 = available_cards(deck).sample

  p card1
  p card2
  deck.each {|number, card| puts number if deck.values.flatten == card1 }
end

# ------- GAME LOGIC -----------------

player_new_hand(deck)







