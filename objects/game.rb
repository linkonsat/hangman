# frozen_string_literal: true

require 'pry-byebug'
require_relative 'game_announcements'
require_relative 'display'
require_relative 'turn'
require 'json'
#contains the main game objects that returns a winner or loser using other moduels/classes
class Game
  attr_accessor :chances, :word
  include GameAnnouncements
  def initialize
    @word = nil
  end

  def main_game 
  chances_set(7) 
  word
  turn  
  end
  
  def saved_game(data)
    run_saved_game(data)
  end

  private

  def random_word_generator
    file = File.open('./dictionary/5desk.txt')
    file_words = file.readlines.map(&:chomp)
    file_words[rand(61406)]
  end
  
  def chances_set(chances)
    @chances = chances
  end

  def word
    @word = random_word_generator
  end

  def wrong_choice
    @chances -= 1  
  end

  def save(data)

  somefile = File.open("game_data", "w+") 
  data.each { |item| somefile.puts "#{item}"}  
  
  end
  def turn

   comparison_words = Turn.new(@word,default_display(@word))
  
   until(@chances == 0 || comparison_words.win(@word,comparison_words.current_letters))
    guess = authenticate
    if (guess == "save")
      save([@word, @chances,comparison_words.current_letters.join('')])
      return 
    else (guess != "save" )
      comparison_words.player_display(comparison_words.word,comparison_words.current_letters,guess)
      wrong_choice
      puts @chances
      puts comparison_words.current_letters.join('')
      if (@word != comparison_words.current_letters && @chances == 0)
        puts "You lost! The word was #{@word}"
    end
   end

  end
  rerun
  end
  
  def rerun
   
    puts "if you want to play again enter y else enter any other key"
    if (gets.chomp == "y")
      main_game
    end
  end
  def authenticate
 
    guess = gets.chomp
   
    unless ( guess == "save" || guess.length == 1 && ('a'..'z').include?(guess) )
    puts "enter a single letter"
    guess = gets.chomp
    end
    return guess
  end  
  def run_saved_game(data)
    @word = data[0]
    @chances = data[1].to_i
    comparison_words = Turn.new(@word,data[2])
    puts @chances
    puts comparison_words.current_letters
    
    until(@chances == 0 || comparison_words.win(@word,comparison_words.current_letters))
      guess = authenticate
      if (guess == "save")
        save([@word, @chances,comparison_words.current_letters])
        return 
      else (guess != "save" )
        comparison_words.player_display(comparison_words.word,comparison_words.current_letters,guess)
        wrong_choice
        puts @chances
        puts comparison_words.current_letters.join('')
        if (@word != comparison_words.current_letters && @chances == 0)
          puts "You lost! The word was #{@word}"
      end
     end
  
    end
    rerun
  end
end
