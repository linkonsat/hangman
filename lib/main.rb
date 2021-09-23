# frozen_string_literal: true

require 'pry-byebug'
require 'yaml'
require './objects/game'


def game_start
  Game.new.introduction
  Game.new.main_game
end

def check_save_file
  puts 'found a saved game! would you like to continue it?(test)'
end

check_save_file
game_start
