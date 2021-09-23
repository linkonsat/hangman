require 'pry-byebug'
require 'yaml'
require './objects/game.rb'


def game_start
        Game.new.introduction
end

def check_save_file
puts "found a saved game! would you like to continue it?(test)"
end

check_save_file()
game_start()