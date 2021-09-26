# frozen_string_literal: true

require 'pry-byebug'
require_relative 'game_announcements'
require_relative 'display'
require_relative 'turn'
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

  def turn
   comparison_words = Turn.new(@word,default_display(@word))
   until(@chances.chances == 0)
   comparison_words.player_display(comparison_words.word,comparison_words.current_letters)
   wrong_choice
  end
  end
end
