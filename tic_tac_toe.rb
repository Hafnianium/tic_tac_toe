class Board
  attr_accessor :spaces

  def initialize
    @spaces = Array.new(9, ' ')
  end

  def display_board
    puts "_____________"
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

  def initialize(name)
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
    @first_turn = ""
    @winner = ""

    play_game
  end

  def play_game
    player_name_input
    while true
      take_turn
    end
  end

  def take_turn
    @board.display_board
    puts "X Player pick a number from 1-9."
    player_input = (gets.chomp.to_i - 1)
    @board.add_marker(player_input, x_player.marker)
    @board.display_board
    puts "O Player pick a number from 1-9."
    player_input = (gets.chomp.to_i - 1)
    @board.add_marker(player_input, o_player.marker)
  end

  def player_name_input
    puts "X player enter your name"
    @x_player.name = gets.chomp.to_s
    @x_player.marker = "X"
    puts "O player enter your name"
    @o_player.name = gets.chomp.to_s
    @o_player.marker = "O"
  end
end

class TicTacToeStarter
  def initialize
    welcome_screen
    board = Board.new
    x_player, o_player = Player.new(@name1), Player.new(@name2)
    Game.new(x_player, o_player, board)
  end

  def welcome_screen
    puts "|| Welcome to Tic Tac Toe! ||"
    puts "||-------------------------||\n\n\n"
    print "Enter X player's name: "
    @name1 = gets.chomp
    puts " "
    print "Enter O player's name: "
    @name2 = gets.chomp
    puts " "
  end
end

TicTacToeStarter.new