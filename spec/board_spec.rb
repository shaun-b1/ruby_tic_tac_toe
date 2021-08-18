require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe Board do
  describe '#initialize' do
    # Initialize does not need to be tested
  end

  describe '#display_board' do
    # Public script method -> no test necessary, but test all the methods inside it
  end

  describe '#display_row' do
    # Method only contains puts -> no test required
  end

  describe '#display_line_break' do
    # Method only contains puts -> no test required
  end

  describe '#win_board?' do

    let(:player_win) { instance_double(Player, symbol: 'X') }

    context 'when the player has three horizontal marks in a row' do
      subject(:game_win_horizontal) { described_class.new(['X', 'X', 'X', 4, 5, 6, 7, 8, 9]) }

      it 'returns true' do
        winner_horizontal = game_win_horizontal.win_board?(player_win)
        expect(winner_horizontal).to be true
      end
    end

    context 'when the player has three vertical marks in a row' do
      subject(:game_win_vertical) { described_class.new(['X', 2, 3, 'X', 5, 6, 'X', 8, 9]) }

      it 'returns true' do
        winner_vertical = game_win_vertical.win_board?(player_win)
        expect(winner_vertical).to be true
      end
    end

    context 'when the player has three diagonal marks in a row' do
      subject(:game_win_diagonal) { described_class.new(['X', 2, 3, 4, 'X', 6, 7, 8, 'X']) }

      it 'returns true' do
        winner_diagonal = game_win_diagonal.win_board?(player_win)
        expect(winner_diagonal).to be true
      end
    end

    context 'when the player doesn\'t have three marks in a row' do
      subject(:game_continue) { described_class.new(['X', 2, 3, 4, 'X', 'X', 7, 8, 9]) }

      it 'returns false' do
        winner_continue = game_continue.win_board?(player_win)
        expect(winner_continue).to be false
      end
    end
  end

  describe '#draw?' do

    context 'when the board has no positions for a player to make a move' do
      subject(:game_draw) { described_class.new(['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']) }

      it 'returns true' do
        draw = game_draw.draw?
        expect(draw).to be true
      end
    end

    context 'when the board still has positions for a player to make a move' do
      subject(:game_no_draw) {described_class.new(['X', 'X', 'X', 'X', 'X', 'X', 'X', 8, 'X'])}

      it 'returns false' do
        no_draw = game_no_draw.draw?
        expect(no_draw).to be false
      end
    end
  end
end
