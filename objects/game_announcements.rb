# frozen_string_literal: true
#just puts the introduction and round comments
module GameAnnouncements
  def introduction
    puts "Welcome to hangman. Here is a explanation.
  In hangman your goal is to figure out the entire word
  You do this by entering a letter guess or an entire word
  You only get a certain amount of chanches to do this.
  If you get it wrong the man hanging loses a body part.
  in this version it will be a stick figure character
  if you run out of guesses you lose!
  You will also have a chance to save the game each round. GL."
  end

  def conclusion_wrong(word_guesses_length, word)
    puts "the word was #{word}. You got #{word_guesses_length} right. Better luck next time!"
  end

  def conclusion_right(word)
    puts "you won! the word was #{word}"
  end
  def info 
    puts "go ahead and enter a single letter guess."
  end
end
