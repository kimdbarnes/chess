require 'spec_helper'

module Chess
  describe Piece do
    describe '#draw' do
      it 'should draw the filename at specified coordinates' do
        image_double = double(:image)
        allow(Gosu::Image).to receive(:new).
                                  with('assets/images/pieces/filename').
                                  and_return(image_double)

        expect(image_double).to receive(:draw).with(1, 2, 3)

        described_class.new('filename', 1, 2, 3).draw
      end
    end

    describe '#move' do
      context 'when :forward' do
        it 'should update coordinates' do
          piece = described_class.new('white_king.png', 505, 810, 0)

          piece.move(:forward)

          expect(piece.x_coord).to eq 505
          expect(piece.y_coord).to eq 710
          expect(piece.z_coord).to eq 0
        end

        it 'should not go off the board' do
          piece = described_class.new('white_king.png', 505, 110, 0)

          piece.move(:forward)
          piece.move(:forward)
          piece.move(:forward)
          piece.move(:forward)

          expect(piece.y_coord).to eq 110
        end
      end

      context 'when :backward' do
        it 'should update coordinates' do
          piece = described_class.new('white_king.png', 505, 210, 0)

          piece.move(:backward)

          expect(piece.x_coord).to eq 505
          expect(piece.y_coord).to eq 310
          expect(piece.z_coord).to eq 0
        end

        it 'should not go off the board' do
          piece = described_class.new('white_king.png', 505, 810, 0)

          piece.move(:backward)
          piece.move(:backward)
          piece.move(:backward)
          piece.move(:backward)

          expect(piece.y_coord).to eq 810
        end
      end
    end
  end
end