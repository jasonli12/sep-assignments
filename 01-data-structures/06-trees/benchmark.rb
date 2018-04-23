require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'

root = Node.new("Shrek", 88)
iron_man_3 = Node.new("Iron Man 3", 80)
totoro = Node.new("My Neighbor Totoro", 94)
despicable_me_3 = Node.new("Despicable Me 3", 59)
harry_potter_3 = Node.new("Harry Potter and the Prisoner of Azkaban", 91)
moana = Node.new("Moana", 96)
chicken_run = Node.new("Chicken Run", 97)
ice_age = Node.new("Ice Age",  77)
zootopia = Node.new("Zootopia", 98)
lion_king = Node.new("The Lion King", 92)
kung_fu_panda = Node.new("Kung Fu Panda", 87)
captain_underpants = Node.new("Captain Underpants: The First Epic Movie", 86)

tree = BinarySearchTree.new(root)
tree.insert(root, iron_man_3)
tree.insert(root, totoro)
tree.insert(root, despicable_me_3)
tree.insert(root, harry_potter_3)
tree.insert(root, moana)
tree.insert(root, chicken_run)
tree.insert(root, ice_age)
tree.insert(root, zootopia)
tree.insert(root, lion_king)
tree.insert(root, kung_fu_panda)
tree.insert(root, captain_underpants)
tree.printf

heap = MinBinaryHeap.new(root)
heap.insert(iron_man_3)
heap.insert(totoro)
heap.insert(despicable_me_3)
heap.insert(harry_potter_3)
heap.insert(moana)
heap.insert(chicken_run)
heap.insert(ice_age)
heap.insert(zootopia)
heap.insert(lion_king)
heap.insert(kung_fu_panda)
heap.insert(captain_underpants)
heap.printf

Insert all numbers from 1 to 100000 into both Trees, then use Benchmark to compare performance:
How much time does an average insertion consume in the Binary Search Tree compared to the Heap?

n = 10000
root = Node.new(0, 0)
p "Insert 1 to 10000"

benchmark_tree = BinarySearchTree.new(root)
benchmark_min_heap = MinBinaryHeap.new(root)

Benchmark.bm(7) do |x|
  x.report("tree:") { for i in 1..n; benchmark_tree.insert(root, Node.new(i, i)); end }
  x.report("heap:") { for i in 1..n; benchmark_min_heap.insert(Node.new(i, i)); end }
end

p "Find 5000"

target = 5000
benchmark_tree_2 = BinarySearchTree.new(root)
benchmark_min_heap_2 = MinBinaryHeap.new(root)


for i in 1..n
   benchmark_tree_2.insert(root, Node.new(i, i))
   benchmark_min_heap.insert(Node.new(i, i))
end

Benchmark.bm(7) do |x|
  x.report("tree:") { benchmark_tree_2.find(root, target) }
  x.report("heap:") { benchmark_min_heap.find(target) }
end

p "Delete 5000"

Benchmark.bm(7) do |x|
  x.report("tree:") { benchmark_tree_2.delete(root, target) }
  x.report("heap:") { benchmark_min_heap.delete(target) }
end
