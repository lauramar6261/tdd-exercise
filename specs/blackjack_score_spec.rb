require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require 'pry'
require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjac Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do
    # Arrange
    hand = [10, "King", "Jack"]

    expect {
      score = blackjack_score(hand)
    }.must_raise ArgumentError

  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ["Ace", 1, 5]

    score = blackjack_score(hand)

    expect(score).must_equal 17

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = ["Ace", 9, 9]

    score = blackjack_score(hand)

    expect(score).must_equal 19

  end

  it 'raises an ArgumentError for invalid cards' do
    # Arrange
    hand = [12, 11, 11]

    # Assert
    expect {
      score = blackjack_score(hand) # this method call generates error
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
        # Arrange
        hand = [10, "King", "Jack"]

        # Assert
        expect {
          score = blackjack_score(hand) # this method call generates error
        }.must_raise ArgumentError
  end

  it 'raises an ArgumentError if you have more than 5 cards' do
        # Arrange
        hand = [10, "King", "Jack", 1, 4, 6]

        # Assert
        expect {
          score = blackjack_score(hand) # this method call generates error
        }.must_raise ArgumentError
  end

  it 'raises an ArgumentError if you have less than 2 cards' do
        # Arrange
        hand = [1]

        # Assert
        expect {
          score = blackjack_score(hand) # this method call generates error
          binding.pry
        }.must_raise ArgumentError
  end
end
