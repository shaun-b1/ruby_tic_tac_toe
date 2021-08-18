require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

describe Player do

  describe '#initialize' do
    # Initialize does not need to be tested
  end

  describe '#receive_input' do

    let(:board_input) { instance_double(Board, game_board: [1, 2, 3, 4, 5, 6, 7, 8, 9]) }
    let(:game_input) { instance_double(Game) }
    subject(:player_input) { described_class.new('Player X', 'X', board_input, game_input)}

    context 'when user inputs a value between 1 and 9' do
      before do
        valid_input = '3'
        allow(player_input).to receive(:gets).and_return(valid_input)
      end

      it 'stops loop and does not display an error message' do
        error = "Input error! Please enter a number between 1 and 9."
        expect(player_input).not_to receive(:puts).with(error)
        player_input.receive_input
      end

    end

    context 'when user inputs a value outside 1 and 9, then a value between 1 and 9' do
      before do
        invalid_input = '10'
        valid_input = '1'
        allow(player_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'displays an error message once' do
        error = "Input error! Please enter a number between 1 and 9."
        expect(player_input).to receive(:puts).with(error).once
        player_input.receive_input
      end
    end

    context 'when user inputs two values outside 1 and 9, then a value between 1 and 9' do
      before do
        invalid_input = '10'
        letter_input = 'a'
        valid_input = '5'
        allow(player_input).to receive(:gets).and_return(invalid_input, letter_input, valid_input)
      end

      it 'displays an error message twice' do
        error = "Input error! Please enter a number between 1 and 9."
        expect(player_input).to receive(:puts).with(error).twice
        player_input.receive_input
      end
    end
  end

  describe '#check_board' do

    let(:game_check) { instance_double(Game) }
    subject(:player_check) { described_class.new('Player X', 'X', board_check, game_check)}

    context 'when an unused position is selected' do
      let(:board_check) { instance_double(Board, game_board: [1, 2, 3, 4, 5, 6, 7, 8, 9]) }

      it 'updates the board instance variable with the player\'s mark' do
        input = 5
        expect { player_check.check_board(input) }.to change { board_check.game_board }.to([1, 2, 3, 4, 'X', 6, 7, 8, 9])
      end
    end

    context 'when a used position is selected' do
      let(:board_check) { instance_double(Board, game_board: [1, 2, 3, 4, 'X', 6, 7, 8, 9]) }

      before do
        allow(player_check).to receive(:puts)
        allow(player_check).to receive(:receive_input)
      end

      it 'does not update the board instance variable' do
        input = 5
        expect { player_check.check_board(input) }.to_not change { board_check.game_board }
      end

      it 'displays an error message once' do
        error1 = 'That position is already taken'
        error2 = 'Try another spot'
        input = 5
        expect(player_check).to receive(:puts).with(error1)
        expect(player_check).to receive(:puts).with(error2)
        player_check.check_board(input)
      end

      it 'calls #receive_input' do
        input = 5
        expect(player_check).to receive(:receive_input)
        player_check.check_board(input)
      end
    end
  end
end
