module TicTacToe
  class Board
    attr_accessor :spaces

    def initialize
      @spaces = Array.new(9, ' ')
    end

    def display_board
      board = ''
      (0..8).step(3) do |i|
        board += "| #{@spaces[i]} | #{@spaces[i + 1]} | #{@spaces[i + 2]} |\n"
      end
      puts board + "\n\n\n"
    end
    
    def add_marker(position, marker)
      @spaces[position] = marker
    end
  end

  class Player
    attr_accessor :name, :marker

    def initialize(name)
      @name = name
    end
  end

  class Game
    attr_accessor :player1, :player2, :turn, :board

    @@winning_positions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 7],
      [0, 4, 8], [2, 4, 6]
    ]

    def initialize(player1, player2, board)
      @player1 = player1
      @player2 = player2
      @board = board

      @current_turn = 1
      @first_turn =""
      @winner = ""

      play
    end

    def play
      pick_first_turn
      allocate_markers
      take_turns
    end

    def pick_first_turn
      random = Random.new
      first_turn = random.rand(0..1)
      if first_turn == 0
        @first_turn = @player1.name
      elsif first_turn == 1
        @first_turn = @player2.name
      end
      puts "#{@first_turn} goes first."
    end

    def allocate_markers
      @player1.marker = "X"
      @player2.marker = "O"
    end

    def take_turns
      until draw? || @winner != ""
        if @first_turn == @player1.name
          (@current_turn.even?) ? turn(@player2) : turn(@player1)
        elsif @first_turn == @player2.name
          (@current_turn.even?) ? turn(@player1) : turn(@player2)
        end
      end
      puts "Game was a draw!" if draw? #checks if game is a draw after loop ends
    end

    def turn(player) #one turn for a player
      puts "Turn #{@current_turn}:"
      puts "---------------------------\n\n\n"
      @board.display_board
      print "#{player.name}, enter the cell number that you would like to use (1-9): "
      input = gets.chomp.to_i
      @board.add_marker(input, player.marker)
      announce_win(player)
      @current_turn += 1
    end

    def announce_win(player)
      check_winner(player)
      if @winner == player.name
        puts "#{player.name} is the winner!"
      end
    end

    def draw? #checks if the game is a draw
      (@current_turn == @board.spaces.length) && (@winner == "")
    end

    def check_winner(player) #if a player is a winner, the @winner instance var is set to that player
      @@winning_positions.each do |triplet|
        @winner = player.name if triplet.all? { |a| @board.spaces[a] == player.marker }
      end
    end
  end

  class TicTacToePlayer
    attr_accessor :name1, :name2, :game_data

    def initialize
      welcome_screen
      game_start
    end

    def welcome_screen
      puts "|| Welcome to Tic Tac Toe! ||"
      puts "||-------------------------||\n\n\n"
      print "Enter Player 1's name: "
      @name1 = gets.chomp
      puts " "
      print "Enter Player 2's name: "
      @name2 = gets.chomp
      puts " "
    end

    def game_start #creates and runs a game
      board = Board.new
      player1, player2 = Player.new(@name1), Player.new(@name2)
      game = Game.new(player1, player2, board)
    end
  end
  TicTacToePlayer.new
end

