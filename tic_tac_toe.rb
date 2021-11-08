class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Player < Person
  attr_reader :marker

  def initialize(name, marker)
    super(name)
    @marker = marker
  end
end

class Board
  WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],
                   [1, 4, 7],[2, 5, 8],[6, 4, 2],[0, 4, 8]]
  def initialize
    @board = [' ', ' ', ' ',  ', ' ', ' ',  ', ' ', ' ']
  end
end

def turn
  print "Please pick a number between 1-9"
  position = gets.chomp.to_i
  position -= 1
  @board[position] = player.sign
end
