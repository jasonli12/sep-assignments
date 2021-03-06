require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width, @height = width, height
    @matrix = Array.new(height) { Array.new(width) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[y][x] = pixel
  end

  def at(x, y)
    @matrix[y][x]
  end

  private

  def inbounds(x, y)
  end

end
