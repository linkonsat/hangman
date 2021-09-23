# frozen_string_literal: true

require 'pry-byebug'
require 'yaml'
require './objects/game'


def game_start
  Game.new.introduction
  random_word_generator
end

def check_save_file
  puts 'found a saved game! would you like to continue it?(test)'
end
def random_word_generator
    file = File.open('./dictionary/5desk.txt')
    file_words = file.readlines.map(&:chomp)
    p  file_words[rand(61406)]
end
check_save_file
game_start
