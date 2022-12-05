require 'scanf'
input = File.read("input.txt")

data, instructions = input.split("\n\n").map { |s| s.split("\n") }
size = data.pop.split(" ")[-1].to_i
data = data.map { |s| s.chars.each_slice(4).map { |s| s[1] } }

stacks = Array.new(size) { Array.new() }

(0...data.length).each do |x|
  (0...size).each do |y|
    if data[x][y] != ' '
      stacks[y].append data[x][y]
    end
  end
end

instructions.each do |s|
  s.scanf("move %d from %d to %d") do |amount, stack_a, stack_b|
    stacks[stack_b - 1].unshift *stacks[stack_a - 1].shift(amount)
  end
end

stacks.each { |s| print s[0] }
puts
