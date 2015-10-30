def calculate_total(cards)
  card_values = cards.map {|i| i[0]}
  total = 0
  card_values.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
  card_values.each do |value|
    if value == 'A' && total > 21
      total -= 10
    end
  end
total
end

def compare_total(dealer_total, player_total, player_name, dealer_name)
  if dealer_total >= player_total
    puts "#{dealer_name} won with a total of #{dealer_total} compared to #{player_name}'s #{player_total}."
  else
    puts "#{player_name} won with a total of #{player_total} over #{dealer_name}'s' #{dealer_total}."
  end
end

def opening_hand_message(player_name, cards)
  puts "#{player_name} has a #{cards[0]} and a #{cards[1]}."
end

def blackjack_check(dealer_total, player_total, dealer_cards, player_cards, player_name, dealer_name)
  if dealer_total == 21 && player_total == 21
    opening_hand_message(player_name, player_cards)
    opening_hand_message(dealer_name, dealer_cards)
    puts "Both players get Blackjack. Keep your money."
    return "blackjack"
  elsif player_total == 21
    opening_hand_message(player_name, player_cards)
    puts "Blackjack! You win!"
    return "blackjack"
  elsif dealer_total == 21
    opening_hand_message(player_name, player_cards)
    opening_hand_message(dealer_name, dealer_cards)
    puts "Dealer got Blackjack. Dealer wins."
    return "blackjack"
  end
end

suits = ['D', 'H', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = cards.product(suits)

puts "Welcome to Blackjack. What's your name?"
player_name = gets.chomp.capitalize
dealer_name = "Dealer"
sleep 1
puts "Hello #{player_name}. Let's deal..."

loop do

  deck.shuffle!

  player_cards = []
  dealer_cards = []

  player_cards << deck.shift
  dealer_cards << deck.shift
  player_cards << deck.shift
  dealer_cards << deck.shift

  player_total = calculate_total(player_cards)
  dealer_total = calculate_total(dealer_cards)

  sleep 1

  if blackjack_check(dealer_total, player_total, dealer_cards, player_cards, player_name, dealer_name) == nil
  puts opening_hand_message(player_name, player_cards)
  puts "#{player_name}'s total is #{calculate_total(player_cards)}."
  puts "#{dealer_name} has a #{dealer_cards[0]}."

    while player_total < 21
      puts "Press (1) to hit or (2) to stay."
      hit_or_stay = gets.chomp.to_i
     
      if hit_or_stay == 1
        player_cards << deck.shift
        player_total = calculate_total(player_cards) 
        puts "#{player_name} were dealt a #{player_cards.last}."
        puts "Total is now #{calculate_total(player_cards)}."
        if player_total == 21
          puts "#{player_name} got 21!"
          break
        elsif player_total > 21
          puts "Bust! #{dealer_name} wins."
          break
        end
      elsif hit_or_stay == 2
        puts "#{player_name} is staying with #{calculate_total(player_cards)}."
        break
      else
        puts "Sorry I didn't get that. Please just hit a (1) or a (2)."
      end     
    end

    if player_total <= 21
      sleep 1 
      puts "#{dealer_name}'s second card is #{dealer_cards[1]} for a total of #{calculate_total(dealer_cards)}."
      
      if (17..21).include?(dealer_total)
        puts "#{dealer_name} must stay with #{dealer_total}."
        compare_total(dealer_total, player_total, player_name, dealer_name)
      end
      
      while dealer_total < 17
        sleep 1
        dealer_cards << deck.shift
        puts "#{dealer_name} was dealt a #{dealer_cards.last}."
        dealer_total = calculate_total(dealer_cards)
        puts "Total is now #{dealer_total}."
        if dealer_total < 17
        elsif (17..21).include?(dealer_total)
          puts "#{dealer_name} must stay with a total of #{dealer_total}"
          compare_total(dealer_total, player_total, player_name, dealer_name)
        else
          puts "#{dealer_name} busts! #{player_name} wins!"
        end
      end
    end
  end
  sleep 1
  puts "Play again? (Y/N)"
  play_again = gets.chomp.upcase
  break unless play_again == 'Y'
end

    
# Questions: How to concatenate a string on to a method?


