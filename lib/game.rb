# frozen_string_literal: true

# Defines the game class that will play the turns of the game and sets the rules to declare a winner
class Game
  protected

  attr_accessor :player_x, :player_o, :board, :turncount

  def initialize(board = Board.new,
                 player_x = Player.new('Player X', 'X', board, self),
                 player_o = Player.new('Player O', 'O', board, self))
    @board = board
    @player_x = player_x
    @player_o = player_o
    @turncount = 1
  end

  public

  def play
    until board.win_board?(player_x) || board.win_board?(player_o) || board.draw?
      @turncount.odd? ? turn(player_x) : turn(player_o)
    end
    puts "It's a tie!" if board.draw?
  end

  protected

  def turn(player)
    board.display_board
    puts "#{player.name}, where do you want to place your mark: "
    player.receive_input
    puts "#{player.name} wins the game!" if board.win_board?(player)
    @turncount += 1
  end
end
