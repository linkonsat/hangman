# frozen_string_literal: true
#displays chances and reduces it when a guess is entered
class Display
    attr_accessor :chances
  def initialize(chances)
    @chances = chances
  end
  def show_chances(chances) 
    puts chances 
  end
  


end