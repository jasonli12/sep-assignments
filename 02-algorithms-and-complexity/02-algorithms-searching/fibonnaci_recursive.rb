require 'benchmark'

def fib(n)
  fib_0 = 0
  fib_1 = 1
  for n in 0..(n - 1)
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end
  return fib_1
end

def fib_recursive(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
   return fib(n-1) + fib(n-2)
  end
end

Benchmark.bm(7) do |x|
  x.report("iterative") { fib(20) }
  x.report("recursive") { fib_recursive(20) }
end
