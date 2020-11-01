class Player
  attr_accessor :name, :symbol, :turn, :board


  def initialize(name, symbol, turn, board)
    @name = name
    @symbol = symbol
    @turn = turn
    @board = board
  end

  def get_input
    puts "#{self.name}, where do you want to place your mark: "
    choice = gets.chomp.to_i
    return choice
  end
end

class Board
  attr_accessor :game_board

  def initialize
    @game_board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts "#{self.game_board[1]} | #{self.game_board[2]} | #{self.game_board[3]} "
    puts "---------"
    puts "#{self.game_board[4]} | #{self.game_board[5]} | #{self.game_board[6]} "
    puts "---------"
    puts "#{self.game_board[7]} | #{self.game_board[8]} | #{self.game_board[9]} "
  end
end

class Game
  attr_accessor :player_x, :player_o, :board

  @@turncount = 1

  def initialize
    @board = Board.new
    @player_x = Player.new("Player X", "X", 1, board)
    @player_o = Player.new("Player O", "O", 2, board)
  end

  def play()
    9.times do
      if @@turncount.odd?
        answer = player_x.get_input
        board.game_board[answer] = "#{player_x.symbol}"
        board.display_board
        @@turncount += 1
      elsif @@turncount.even?
        answer = player_o.get_input
        board.game_board[answer] = "#{player_o.symbol}"
        board.display_board
        @@turncount += 1
      end
    end
  end
end

new_game = Game.new
new_game.play
