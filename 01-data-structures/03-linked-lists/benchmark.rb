require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
array = []
llist = LinkedList.new

p "Push 10,000 Items"

Benchmark.bm(7) do |x|
  x.report("array") { n.times do; array.push("1"); end }
  x.report("linked list")  { n.times do; llist.add_to_tail(Node.new("1")); end }
end

p "Access 5,000th Element/Node"

Benchmark.bm(7) do |x|
  x.report("array") { array[5000] }
  x.report("linked list") { llist.find_n_node(5000) }
end

p "Remove 5,000th Element/Node"

Benchmark.bm(7) do |x|
  x.report("array") { array.delete_at(5000) }
  x.report("linked list") { llist.remove_n_node(5000) }
end
