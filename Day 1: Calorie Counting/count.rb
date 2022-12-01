puts File.read("input.txt").split("\n\n").map { |s| s.split("\n").sum { |n| n.to_i} }.sort!.reverse![0,3].sum
