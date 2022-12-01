input = File.read("input.txt")

sums = input.split("\n\n").map { |s| s.split("\n").sum { |n| n.to_i} }
sums.sort!.reverse!
puts sums[0,3].sum
