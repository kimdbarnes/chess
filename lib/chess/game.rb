require 'gosu'

module Chess
  class Game < Gosu::Window
    def initialize
      super(1000, 1000)
      self.caption = 'MoChess'
      @pieces = [
          Piece.new('white_king.png', 505, 810, 0),
      ]
    end

    def update
      selected_piece = @pieces.first

      if Gosu::button_down? Gosu::KbUp
        selected_piece.move(:forward)
      elsif Gosu::button_down? Gosu::KbDown
        selected_piece.move(:backward)
      end
    end

    def draw
      Gosu::Image.new('assets/images/background/board.jpg', tileable: true).draw(0, 0, 0)
      pieces.each { |piece| piece.draw }
    end

    private

    attr_reader :pieces
  end
end