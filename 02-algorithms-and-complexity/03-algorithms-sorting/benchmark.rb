require 'benchmark'
require_relative './quick_sort.rb'
require_relative './heap_sort.rb'
require_relative './bucket_sort.rb'

array_one = [
0.1, 0.5, 0.3, 0.67, 0.45, 0.23, 0.02, 0.95, 0.03, 0.07,
0.8, 0.59, 0.32, 0.21, 0.39, 0.55, 0.24, 0.97, 0.71, 0.33,
0.89, 0.93, 0.72, 0.56, 0.66, 0.44, 0.11, 0.22, 0.77, 0.88,
0.99, 0.98, 0.15, 0.17, 0.26, 0.29, 0.38, 0.73, 0.7, 0.6,
0.54, 0.41, 0.52, 0.69, 0.43, 0.47, 0.57, 0.83, 0.65, 0.75]

Benchmark.bm(7) do |x|
  x.report("quick_sort") { quick_sort(array_one) }
  x.report("heap_sort") { heap_sort(array_one) }
  x.report("bucket_sort") { bucket_sort(array_one) }
end
