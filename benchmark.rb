require 'benchmark'
require './day_01/solution.rb'

def benchmarks
  time = Benchmark.bm do |x|
    x.report("Day1 partA:") { solution_01_a }
    x.report("Day1 partB:") { solution_01_b }
  end
end

benchmarks