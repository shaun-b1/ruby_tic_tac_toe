# frozen_string_literal: true

# Defines the game class that will play the turns of the game and sets the rules to declare a winner
class Game
  protected

  attr_accessor :player_x, :player_o, :board, :turncount

  def initialize
    @board = Board.new
    @player_x = Player.new('Player X', 'X', board, self)
    @player_o = Player.new('Player O', 'O', board, self)
    @turncount = 1
  end

  public

  def play
    until @turncount > 9
      if @turncount.odd?
        board.display_board
        turn(player_x)
      elsif @turncount.even?
        board.display_board
        turn(player_o)
      end
    end
  end

  protected

  def turn(player)
    player.recieve_input
    if board.win_board(player) == true
      @turncount += 10
      board.display_board
      puts "#{player.name} wins the game!"
    elsif board.draw == true
      board.display_board
      puts "It's a tie!"
    end
    @turncount += 1
  end
end
