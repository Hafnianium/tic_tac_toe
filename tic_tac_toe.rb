class Board
  attr_accessor :spaces

  WINNING_COMBINATIONS = [
                          [0, 1, 2], [3, 4, 5], [6, 7, 8],
                          [0, 3, 6], [1, 4, 7], [2, 5, 8],
                          [0, 4, 8], [2, 4, 6]]

  def initialize
    @spaces = Array.new(9, ' ')
  end

  def display_board
    puts '_____________'
    i = 0
    while i < @spaces.length
      puts '|   |   |   |'
      puts "| #{@spaces[i]} | #{@spaces[i + 1]} | #{@spaces[i + 2]} |"
      puts '|___|___|___|'
      i += 3
    end
  end

  def add_marker(position, marker)
    @spaces[position] = marker
  end
end

class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Game
  attr_accessor :x_player, :o_player, :board

  def initialize(x_player, o_player, board)
    @x_player = x_player
    @o_player = o_player
    @board = board

    @current_turn = 1
    @first_turn = ''
    @winner = ''

    play_game
  end

  def play_game
    while true
      take_turn
      check_win
  end

  def take_turn
    @board.display_board
    puts 'X Player pick a number from 1-9.'
    player_input = (gets.chomp.to_i - 1)
    @board.add_marker(player_input, x_player.marker)
    @board.display_board
    puts 'O Player pick a number from 1-9.'
    player_input = (gets.chomp.to_i - 1)
    @board.add_marker(player_input, o_player.marker)
  end

  def check_win
    WINNING_COMBINATIONS.each do |triplet|
      @winner = x_player if triplet.all? {|element| @board.spaces[element] == x_player.marker}
      end
    end
    WINNING_COMBINATIONS.each do |triplet|
      @winner = o_player if triplet.all? {|element| @board.spaces[element] == o_player.marker}
      end
    end
  end

class TicTacToeStarter
  def initialize
    welcome_screen
    board = Board.new
    x_player = Player.new(@name1, 'X')
    o_player = Player.new(@name2, 'O')
    Game.new(x_player, o_player, board)
  end

  def welcome_screen
    puts '|| Welcome to Tic Tac Toe! ||'
    puts "||-------------------------||\n\n\n"
    print "Enter X player's name: "
    @name1 = gets.chomp
    puts ' '
    print "Enter O player's name: "
    @name2 = gets.chomp
    puts ' '
  end
end

TicTacToeStarter.new
