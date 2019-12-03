require 'benchmark'
require './day_01/solution.rb'

def benchmarks
  time = Benchmark.bm do |x|
    x.report("Day1 partA:") { solution_01_a }
  end
end

benchmarks