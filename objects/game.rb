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
  chances_set(Display.new(7)) 
  word
  turn  
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
    @chances.chances -= 1  
  end

  def save(data)

  somefile = File.open("game_data", "w+") 
  data.each { |item| somefile.puts "#{item}"}  
 
  end
  def turn
   comparison_words = Turn.new(@word,default_display(@word))
   until(@chances.chances == 0 || comparison_words.win(@word,comparison_words.current_letters))
    save([@word, @chances.chances,comparison_words.current_letters.join('')])
   comparison_words.player_display(comparison_words.word,comparison_words.current_letters)
   wrong_choice
   end
  if (@word != comparison_words.current_letters)
    puts "You lost! The word was #{@word}"
  end
  rerun
  end
  
  def rerun 
    puts "if you want to play again enter y else enter any other key"
    if (gets.chomp == "y")
      main_game
    end
  end

  def run_saved_game(data)
    @word = data[0]
    @chances = data[1]
    comparison_words = Turn.new(@word,data[2])
  end
end