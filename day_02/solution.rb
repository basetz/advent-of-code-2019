#!/usr/bin/env ruby

# FILEPATH = "./input-edit.txt"
FILEPATH = "day_02/input-edit.txt"

def isvalid(value)
  return [1, 2, 99].include?value
end

def not99(value)
  return value != 99
end

def isAdd(value)
  return value == 1
end

def solve(opValue, val1, val2)
  # p "TEST: [#{opValue}, #{val1}, #{val2}]"
  if isAdd(opValue)
    return val1 + val2
  else
    return val1 * val2
  end
end

def solution_02_a
  reference = File.open(FILEPATH).map(&:strip)[0].split(',').map{|x| x.to_i}
  index = 0
  # puts "START"
  # puts reference.join(',')
  while reference.length >= index + 3
    if isvalid(reference[index]) && not99(reference[index])
      opValue = reference[index]
      val1 = reference[reference[index+1]]
      val2 = reference[reference[index+2]]
      saveTo = reference[index+3]

      reference[saveTo] = solve(opValue, val1, val2)
    else
      break
    end
    index += 4
  end
  # puts "END"
  # puts reference.join(',')
  # puts reference[0]
  reference[0]
end

solution_02_a