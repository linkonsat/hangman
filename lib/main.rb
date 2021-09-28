# frozen_string_literal: true

require 'pry-byebug'
require 'yaml'
require './objects/game'


def game_start
  Game.new.introduction
  Game.new.main_game
end

def check_save_file
 if (File.exist?("game_data")) 
    puts 'found a saved game! To play the saved game enter y else to delte enter del'
    answer = gets.chomp

end
 if (answer == "y")
 
 elsif (answer == "del")
    File.delete("game_data")
end
end

check_save_file
game_start
