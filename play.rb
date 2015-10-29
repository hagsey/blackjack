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

puts total
end

cards = [['2', 'H'], ['7', 'D'], ['A', 'C'], ['K', 'C'], ['A', 'H']]

calculate_total(cards)