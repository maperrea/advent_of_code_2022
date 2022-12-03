############## PART 1 ##############
puts File.read("input.txt").split("\n").map { |s| [s[0,s.length / 2], s[s.length / 2, s.length]] }.map { |s| s[0].chars.select { |c| s[1].include? c }.uniq.sum { |c| c.ord >= 97 && c.ord <= 122 ? c.ord - 96 : c.ord - 38 } }.sum
############## PART 2 ##############
puts File.read("input.txt").split("\n").each_slice(3).map { |s| s[0].chars.select { |c| s[1].include?(c) && s[2].include?(c) }.uniq.sum { |c| c.ord >= 97 && c.ord <= 122 ? c.ord - 96 : c.ord - 38 } }.sum
