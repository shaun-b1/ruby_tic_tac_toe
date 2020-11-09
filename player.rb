# frozen_string_literal: true

# Defines the player class that the two players will be created from
class Player
  attr_accessor :name, :symbol, :board, :game

  protected

  def initialize(name, symbol, board, game)
    @name = name
    @symbol = symbol
    @board = board
    @game = game
  end

  public

  def recieve_input
    puts "#{name}, where do you want to place your mark: "
    begin
      choice = gets.chomp
      choice = Integer(choice)
    rescue ArgumentError
      puts 'Please enter a number between 1 and 9'
      retry
    end
    check_choice_not_taken(choice)
  end

  protected

  def check_choice_not_taken(choice)
    case board.game_board[choice - 1]
    when Integer
      board.game_board[choice - 1] = symbol.to_s
    when String
      puts 'That position is already taken'
      puts 'Try another spot'
      recieve_input
    end
  end
end
