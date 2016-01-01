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
        @y_coord = 710
      else
        @y_coord = 810
      end
    end

    private

    attr_reader :image
  end
end