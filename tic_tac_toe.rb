class Player
  include WinCondition
  attr_accessor :name, :symbol, :turn, :board

  def initialize(name, symbol, turn, board, game)
    @name = name
    @symbol = symbol
    @turn = turn
    @board = board
    @game = game
  end

  def recieve_input
    puts "#{name}, where do you want to place your mark: "
    choice = gets.chomp.to_i
    correct_input_check(choice)
  end

  def correct_input_check(choice)
    if board.game_board[choice - 1].is_a? Integer
      board.game_board[choice - 1] = "#{symbol}"
    elsif board.game_board[choice].is_a? String
      puts 'That position is already taken'
      puts 'Try another spot'
      get_input
    end
  end
end

class Board
  attr_accessor :game_board

  def initialize
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts "#{game_board[0]} | #{game_board[1]} | #{game_board[2]} "
    puts '---------'
    puts "#{game_board[3]} | #{game_board[4]} | #{game_board[5]} "
    puts '---------'
    puts "#{game_board[6]} | #{game_board[7]} | #{game_board[8]} "
  end
end

class Game
  include WinCondition
  attr_accessor :player_x, :player_o, :board, :turncount

  def initialize
    @board = Board.new
    @player_x = Player.new('Player X', 'X', 1, board, self)
    @player_o = Player.new('Player O', 'O', 2, board, self)
    @turncount = 1
  end

  def play
    board.display_board
    until @turncount > 9
      if @turncount.odd?
        player_x.recieve_input
        board.display_board
        # player_x.check_win
        @turncount += 1
      elsif @turncount.even?
        player_o.recieve_input
        board.display_board
        # player_o.check_win
        @turncount += 1
      end
    end
  end
end

new_game = Game.new
new_game.play
