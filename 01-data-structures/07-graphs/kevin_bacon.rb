require_relative "node"

class KevinBacon
  def initialize(start_node)
    @current_path = []
    @current_path_actors = [start_node.name]
    @found = nil
  end

  def find_kevin_bacon(start_node)
    start_node.film_actor_hash.each do |film_name, list_of_actors|
      @current_path.include?(film_name) ? next : @current_path.push(film_name)

      list_of_actors.each do |actor|
        next if @current_path_actors.include?(actor.name)
        @current_path_actors.push(actor.name)
        if actor.name === 'Kevin Bacon'
          @found = true
        elsif @current_path.length < 6
          find_kevin_bacon(actor)
        end
        if @found
          break
        else
          @current_path_actors.pop
        end
      end
      if @found
        break
      else
        @current_path.pop
      end
    end
    if @found
      return @current_path
    else
      return 'Not Found'
    end
  end
end
