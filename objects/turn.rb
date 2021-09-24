# frozen_string_literal: true
require_relative 'game'
require_relative 'display'
#handles the turn
class Turn
 
  def new_display(word, guess, current_letters)
    i = 0
    while i < word.length
        if (word[i] == guess)
            current_letters[i] = guess
        else
            current_letters[i] = "_"
        end
    end
  end
end