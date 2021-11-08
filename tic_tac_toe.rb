class Board
  @@inital_state = [["_", "|", "_", "|", "_"], 
  ["_", "|", "_", "|", "_"],
  [" ", "|", " ", "|", " "]]
  def initialize
    @state = @@inital_state
  end

  def display_board
    i = 0
    while i < @state[0].length
      print @state[0][i]
      i += 1
    end
    print "\n"
    i = 0
    while i < @state[1].length
      print @state[1][i]
      i += 1
    end
    print "\n"
    i = 0
    while i < @state[2].length
      print @state[2][i]
      i += 1
    end
  end
end

new_board = Board.new

new_board.display_board
