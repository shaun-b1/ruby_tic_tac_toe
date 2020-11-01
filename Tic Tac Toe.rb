class Player
  attr_accessor :name, :symbol, :turn

  def initialize(name, symbol, turn)
    @name = name
    @symbol = symbol
    @turn = turn
    #game.players << self
  end

  #needs to:

    #take player input and assign to an instance variable.

    #turn instance variable
end

class Board
  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def display_board
    @board.each do |r|
      puts r.each { |p| p }.join(" ")
    end
  end
end

class Game

    #initialize

    #new player method

    #new board method

    #start a new game that intializes with player x, player o and a new game board.

    #display board

    #count each turn

    #check for a win on each turn

    #after 9 turns, end game

end
