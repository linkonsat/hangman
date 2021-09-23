# frozen_string_literal: true

require 'pry-byebug'
require_relative 'game_announcements'
require_relative 'display'
#contains the main game objects that returns a winner or loser using other moduels/classes
class Game
  include GameAnnouncements
  def initialize
    @word = nil
  end
  def main_game 
  chances 
  word
  end
  private
  def random_word_generator
    file = File.open('./dictionary/5desk.txt')
    file_words = file.readlines.map(&:chomp)
    file_words[rand(61406)]
  end
  
  def chances
    @chances = Display.new(7)
    chances = @chances
    puts chances.show_chances
  end
  
  def word
    @word = random_word_generator
    puts word = @word
  end
end
