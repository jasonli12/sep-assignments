require_relative "node"

def find_kevin_bacon(start_node)
  found = nil
  current_path = []
  current_path_actors = [start_node]
  start_node.film_actor_hash.each do |film_name, list_of_actors|
    current_path.include?(film_name) ? next : current_path.push[film_name]

    list_of_actors.each do |actor|
      next if current_path_actors.include?(actor)
      current_path_actors.push(actor)
      if actor.name === 'Kevin Bacon'
        found = true
      elsif current_path.length < 6
        find_kevin_bacon(actor)
      end
      if found
        break
      else
        current_path_actors.pop
      end
    end
    if found
      break
    else
      current_path.pop
    end
  end
  return current_path
end
