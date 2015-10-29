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

def winning_message(message)
end

def compare_total(dealer_total, player_total)
  if dealer_total >= player_total
    puts "Dealer won with a total of #{dealer_total} over your #{player_total}."
  else
    puts "You won with a total of #{player_total} over the dealer's #{dealer_total}."
  end
end

def blackjack_check(dealer_total, player_total)
  if dealer_total == 21 && player_total == 21
    puts "You have a #{player_cards[0]} and a #{player_cards[1]}."
    puts "Dealer has a #{dealer_cards[0]} ana a #{dealer_cards[1]}."
    puts "Both players get Blackjack. Dealer wins."
  elsif player_total == 21
    puts "You have a #{player_cards[0]} and a #{player_cards[1]} for a Blackjack!"
  elsif dealer_total == 21
    puts "You have a #{player_cards[0]} and a #{player_cards[1]}."
    puts "Dealer has a #{dealer_cards[0]} ana a #{dealer_cards[1]}."
    puts "Dealer got Blackjack. Dealer wins."
  end
  nil
end

suits = ['D', 'H', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = cards.product(suits)
deck.shuffle!

player_cards = []
dealer_cards = []

player_cards << deck.shift
dealer_cards << deck.shift
player_cards << deck.shift
dealer_cards << deck.shift

player_total = calculate_total(player_cards)
dealer_total = calculate_total(dealer_cards)

loop do
  if blackjack_check(dealer_total, player_total) == nil

  puts "You have a #{player_cards[0]} and a #{player_cards[1]} for a total of #{calculate_total(player_cards)}."
  puts "Dealer has a #{dealer_cards[0]}."

    while player_total < 21
      puts "Press (1) to hit or (2) to stay."
      hit_or_stay = gets.chomp.to_i
      if hit_or_stay == 1
        player_cards << deck.shift
        puts "You were dealt a #{player_cards.last}."
        puts "Your total is now #{calculate_total(player_cards)}."
        if player_total == 21
          puts "You got 21!"
          break
        end
      elsif hit_or_stay == 2
        puts "You're staying with #{calculate_total(player_cards)}."
        break
      else
        puts "Sorry I didn't get that."
      end
      player_total = calculate_total(player_cards)
      if player_total > 21
        puts "Bust! Dealer wins."
        break
      end
    end

    if player_total <= 21 
      puts "Dealer's second card is #{dealer_cards[1]} for a total of #{calculate_total(dealer_cards)}."
      while dealer_total < 17
        dealer_cards << deck.shift
        puts "Dealer was dealt a #{dealer_cards.last}."
        dealer_total = calculate_total(dealer_cards)
        if dealer_total <= 21
          puts "Dealer must stay with a total of #{dealer_total}"
          compare_total(dealer_total, player_total)
        else
          puts "Dealer busts! You win."
        end
      end
      if calculate_total(dealer_cards.take(2)) < 21
        puts "Dealer must stay with #{dealer_total}."
        compare_total(dealer_total, player_total)
      end
    end
  end
  puts "Play again? (Y/N)"
  play_again = gets.chomp.downcase
  break unless play_again == 'Y'
end

    



