require 'benchmark'
require './day_01/solution.rb'
require './day_02/solution.rb'

def benchmarks
  time = Benchmark.bm do |x|
    x.report("Day1 partA:\n") { solution_01_a }
    x.report("Day1 partB:\n") { solution_01_b }
    x.report("Day2 partA:\n") { solution_02_a }
    x.report("Day2 partB:\n") { solution_02_b }
  end
end

benchmarks