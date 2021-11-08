# frozen_string_literal: true

class Board
  attr_accessor :state

  def initialize
    self.state = [['_', '|', '_', '|', '_'],
                  ['_', '|', '_', '|', '_'],
                  [' ', '|', ' ', '|', ' ']]
  end

  def display_board
    puts(state.map { |element| element.join(' ') })
  end
end

new_board = Board.new
new_board.display_board
