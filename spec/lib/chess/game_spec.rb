require 'spec_helper'

module Chess
  describe Game do
    describe '#initialize' do
      it 'should have a caption' do
        expect(described_class.new.caption).to eq 'MoChess'
      end

      it 'should set its height' do
        expect(described_class.new.height).to eq 1000
      end

      it 'should set its width' do
        expect(described_class.new.width).to eq 1000
      end
    end

    describe '#update' do
      it 'should move a piece' do
        piece_double = double(:piece)
        allow(Piece).to receive(:new).and_return(piece_double)

        expect(piece_double).to receive(:move)

        described_class.new.update
      end
    end

    describe '#draw' do
      before do
        allow(Gosu::Image).to receive(:new).and_return(double(draw: nil))
      end

      it 'should draw the background image' do
        image_double = double(:image)
        allow(Gosu::Image).to receive(:new).
                                  with('assets/images/background/board.jpg', tileable: true).
                                  and_return(image_double)

        expect(image_double).to receive(:draw).with(0, 0, 0)

        described_class.new.draw
      end

      it 'should draw the initial pieces' do
        king_double = double(:king)
        allow(Gosu::Image).to receive(:new).
                                  with('assets/images/pieces/white_king.png').
                                  and_return(king_double)

        expect(king_double).to receive(:draw).with(505, 810, 0)

        described_class.new.draw
      end
    end
  end
end