puts "############ PART 1 #############"

his = {
  "A" => 1,
  "B" => 2,
  "C" => 3,
}

mine = {
  "X" => 1,
  "Y" => 2,
  "Z" => 3,
}

scores = {
  "X" => 1,
  "Y" => 2,
  "Z" => 3,
}

input = File.read("input.txt").split("\n").map { |s| s.split(" ") }
#input = File.read("example.txt").split("\n").map { |s| s.split(" ") }

score = 0
input.each do |a, b|
  score += scores[b] + (((mine[b] - his[a] + 4) % 3) * 3)
end
puts score

puts "############ PART 2 #############"

his = {
  "A" => 1,
  "B" => 2,
  "C" => 3,
}

mine = {
  "X" => -1,
  "Y" => 0,
  "Z" => 1,
}

scores = {
  "X" => 0,
  "Y" => 3,
  "Z" => 6,
}

score = 0
input.each do |a, b|
  score += scores[b] + his.values[(his[a] - 1 + mine[b]) % 3]
end
puts score
