class Node
  attr_accessor :city_name
  attr_accessor :neighbors
  attr_accessor :visited

  def initialize(city_name, neighbors)
    @city_name = city_name
    @neighbors = neighbors
    @visited = nil
  end
end
