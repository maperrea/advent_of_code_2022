input = File.read("input.txt").split("\n").map { |line| line.split(' ') }.map { |line| [line[0].downcase.to_sym, line[1].to_i] }

## PART 1 ##
visited = Array.new()
$head = {x: 0, y: 0}
$tail = {x: 0, y: 0}

def check_tail
  if ($head[:x] - $tail[:x]).abs > 1
    $tail[:x] += $head[:x] - $tail[:x] > 0 ? 1 : -1
    if ($head[:y] - $tail[:y]).abs >= 1
      $tail[:y] += $head[:y] - $tail[:y] > 0 ? 1 : -1
    end
  elsif ($head[:y] - $tail[:y]).abs > 1
    $tail[:y] += $head[:y] - $tail[:y] > 0 ? 1 : -1
    if ($head[:x] - $tail[:x]).abs >= 1
      $tail[:x] += $head[:x] - $tail[:x] > 0 ? 1 : -1
    end
  end
end

input.each do |dir, amount|
  (0...amount).each do |i|
    case dir
    when :r
      $head[:x] += 1
    when :l
      $head[:x] -= 1
    when :u
      $head[:y] += 1
    when :d
      $head[:y] -= 1
    end
    check_tail()
    visited << [$tail[:x], $tail[:y]]
    #    p $head
    #    p $tail
    #    p "__"
  end
end

#p visited
puts visited.uniq.count

## PART 2 ##

visited = Array.new
$rope = Array.new(10) { Hash.new {0} }


input.each do |dir, amount|
  (0...amount).each do |i|
    case dir
    when :r
      $rope[0][:x] += 1
    when :l
      $rope[0][:x] -= 1
    when :u
      $rope[0][:y] += 1
    when :d
      $rope[0][:y] -= 1
    end

    (0...9).each do |i|
      if ($rope[i][:x] - $rope[i+1][:x]).abs > 1
        $rope[i+1][:x] += $rope[i][:x] - $rope[i+1][:x] > 0 ? 1 : -1
        if ($rope[i][:y] - $rope[i+1][:y]).abs >= 1
          $rope[i+1][:y] += $rope[i][:y] - $rope[i+1][:y] > 0 ? 1 : -1
        end
      elsif ($rope[i][:y] - $rope[i+1][:y]).abs > 1
        $rope[i+1][:y] += $rope[i][:y] - $rope[i+1][:y] > 0 ? 1 : -1
        if ($rope[i][:x] - $rope[i+1][:x]).abs >= 1
          $rope[i+1][:x] += $rope[i][:x] - $rope[i+1][:x] > 0 ? 1 : -1
        end
      end
    end

    visited << [$rope[9][:x], $rope[9][:y]]
  end
end

puts visited.uniq.count
