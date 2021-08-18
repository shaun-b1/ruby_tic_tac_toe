# frozen_string_literal: true

# Defines the player class that the two players will be created from
class Player
  attr_reader :name, :symbol, :board, :game

  protected

  def initialize(name, symbol, board, game)
    @name = name
    @symbol = symbol
    @board = board
    @game = game
  end

  public

  def receive_input
    loop do
      user_input = gets.chomp
      verified_number = check_board(user_input.to_i) if user_input.match?(/^\d$/)
      return verified_number if verified_number

      puts 'Input error! Please enter a number between 1 and 9.'
    end
  end

  protected

  def check_board(input)
    case board.game_board[input - 1]
    when Integer
      board.game_board[input - 1] = @symbol
    when String
      puts 'That position is already taken'
      puts 'Try another spot'
      receive_input
    end
  end
end
