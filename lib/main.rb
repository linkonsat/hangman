# frozen_string_literal: true

require 'pry-byebug'
require 'yaml'
require './objects/game'

Game.new.introduction
def game_start
 
  Game.new.main_game
end

def check_save_file

 if (File.exist?('game_data')) 
    puts 'found a saved game! To play the saved game enter y else to delte enter del'
    answer = gets.chomp

  end
 if (answer == 'y')
  game_data = []
  File.open('game_data').readlines.each do |line| game_data.push(line.chomp) end

  Game.new.saved_game(game_data)
 elsif (answer == "del")
    File.delete("game_data")
 end
 puts "if you would like to start a new game just enter game
else enter any other key to quit"
 answer = gets.chomp
 if (answer == "game")
  game_start
 end

end

check_save_file
