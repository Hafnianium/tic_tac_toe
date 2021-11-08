
class Player 
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Board
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                      [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]]
  def initialize(x_player, y_player)
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @x_player = x_player
    @y_player = y_player
  end

  def display_board
    puts '   |   |   '
    puts " #{@board[0]} | #{@board[1]} |  #{@board[2]} "
    puts '___|___|___'
    puts '   |   |   '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '___|___|___'
    puts '   |   |   '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts '   |   |   '
  end

  def add_marker
    @board[0] = 'X'
  end
end

x_player = Player.new('X')
y_player = Player.new('Y')
new_board = Board.new(x_player, y_player)
new_board.add_marker
new_board.display_board






