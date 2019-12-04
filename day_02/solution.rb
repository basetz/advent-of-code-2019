#!/usr/bin/env ruby

# FILEPATH = "./input.txt"
FILEPATH = "day_02/input.txt"

def isvalid(value)
  [1, 2, 99].include?value
end

def not99(value)
  value != 99
end

def isAdd(value)
  value == 1
end

def evalCode(opValue, val1, val2)
  # p "TEST: [#{opValue}, #{val1}, #{val2}]"
  if isAdd(opValue)
   val1 + val2
  else
    val1 * val2
  end
end

def solution_02_a
  reference = File.open(FILEPATH).map(&:strip)[0].split(',').map{|x| x.to_i}
  solve(reference, 12, 2)
end

def solve(reference, noun=nil, verb=nil)
  index = 0

  reference[1] = noun if noun
  reference[2] = verb if verb

  # puts "START"
  # puts reference.join(',')
  while reference.length >= index + 3
    if isvalid(reference[index]) && not99(reference[index])
      opValue = reference[index]
      val1 = reference[reference[index+1]]
      val2 = reference[reference[index+2]]
      saveTo = reference[index+3]

      reference[saveTo] = evalCode(opValue, val1, val2)
    else
      break
    end
    index += 4
  end
  # puts "END"
  # puts reference.join(',')
  # puts reference[0]
  reference[0].to_i
end

def solution_02_b
  x=0
  y=0
  maxVal = 99
  reference = File.open(FILEPATH).map(&:strip)[0].split(',').map{|x| x.to_i}
  while(x < 100)
    while (y < 100)
      break if solve(reference.dup, x, y) == 19690720
      y+=1
    end
    break if(y != 100)
    y=0 if(y==100)
    x+=1
  end
  # puts "Noun:#{x}, Verb:#{y}"
  # puts "100 * noun + verb = #{100 * x + y}"
end

# solution_02_a
# solution_02_b