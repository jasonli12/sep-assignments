require_relative 'node'

class TravelingSalesman
  def nearest_neighbor(current_city)
    path = [current_city.city_name]
    while current_city.visited === nil
      neighbor_cities = current_city.neighbors
      next_city = nil
      neighbor_cities.each do |neighbor|
        if neighbor[0].visited
          next
        elsif !next_city
          next_city = neighbor
        elsif neighbor[1] < next_city[1]
          next_city = neighbor
        end
      end
      current_city.visited = true
      if next_city
        path.push(next_city[0].city_name)
        current_city = next_city[0]
      end
    end
    return path
  end
end
