# frozen_string_literal: true

# Defines the board class that will display the ongoing game, and outlines the win conditions
class Board
  WIN_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  attr_accessor :game_board

  def initialize
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    system('clear')
    display_first_line(game_board)
    display_line_break
    display_second_line(game_board)
    display_line_break
    display_third_line(game_board)
  end

  def win_board(player)
    WIN_COMBINATION.any? do |win|
      win.all? { |position| @game_board[position] == player.symbol }
    end
  end

  def draw
    @game_board.all? { |position| position.is_a? String }
  end

  protected

  def display_first_line(game_board)
    puts "#{game_board[0]} | #{game_board[1]} | #{game_board[2]} "
  end

  def display_second_line(game_board)
    puts "#{game_board[3]} | #{game_board[4]} | #{game_board[5]} "
  end

  def display_third_line(game_board)
    puts "#{game_board[6]} | #{game_board[7]} | #{game_board[8]} "
  end

  def display_line_break
    puts '---------'
  end
end
