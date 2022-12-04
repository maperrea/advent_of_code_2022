require 'scanf'
########## PART 1 ##########
p File.read("input.txt").scanf("%d-%d,%d-%d\n") { |a, b, c, d| ((a >= c && b <= d) || (c >= a && d <= b)) ? 1 : 0 }.sum
########## PART 2 ##########
p File.read("input.txt").scanf("%d-%d,%d-%d\n") { |a, b, c, d| ((a >= c && a <= d) || (b >= c && b <= d) || (a <= c && b >= d)) ? 1 : 0 }.sum
