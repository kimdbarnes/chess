require 'gosu'

module Chess
  class Piece
    attr_reader :x_coord, :y_coord, :z_coord

    def initialize(image_filename, x_coord, y_coord, z_coord)
      @x_coord = x_coord
      @y_coord = y_coord
      @z_coord = z_coord
      @image = Gosu::Image.new("assets/images/pieces/#{image_filename}")
    end

    def draw
      @image.draw(x_coord, y_coord, z_coord)
    end

    def move(direction)
      if direction == :forward
        if y_coord > 110
          @y_coord = y_coord - 100
        end
      else
        if y_coord < 810
          @y_coord = y_coord + 100
        end
      end
    end

    private

    attr_reader :image
  end
end