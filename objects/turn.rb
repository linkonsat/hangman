# frozen_string_literal: true
require_relative 'game'
require_relative 'display'
#handles the turn
class Turn
 attr_accessor :word, :current_letters

  def initialize(word, current_letters)
    @word = word
    @current_letters = current_letters
  end
  def player_display(word,current_letters,guess)
    i = 0

    while i <= word.length 
        if (word[i] == guess)
            current_letters[i] = guess
        end
        i+= 1
      end
    end

  def win(word,current_letters)
  
    if (word == current_letters)
        return true
    end
  end

end