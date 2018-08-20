require 'pry'

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 'King', 'Queen', 'Jack', 'Ace']

def blackjack_score(hand)
  # verify that input is correct
  hand.length.times do |i|
    next if hand[i] == 'Ace' || hand[i] == 'Queen' || hand[i] == 'Jack' || hand[i] == 'King'
    if hand[i] > 9
      raise ArgumentError, "invalid card"
    end
  end

  if hand.length > 5
    raise ArgumentError, "you have more than 5 cards"
  end

  if hand.length < 2
    raise ArgumentError, "you are missing 1 card"
  end

  # convert face cards into numerical representation
  sum = 0
  hand.length.times do |i|
    if hand[i] == 'King'
      hand[i] = 10
      sum += 10
    elsif hand[i] == 'Queen'
      hand[i] = 10
      sum += 10
    elsif hand[i] == 'Jack'
      hand[i] = 10
      sum += 10
    elsif hand[i] != 'Ace'
      sum += hand[i]
    end
  end

  # if there is an Ace, convert to correct value depending on the total sum
  if hand.include?("Ace")
    if sum <= 10
      sum += 11
    else
      sum += 1
    end
  end

  if sum > 21
    raise ArgumentError, "you went over 21"
  else
    return sum
  end

end
