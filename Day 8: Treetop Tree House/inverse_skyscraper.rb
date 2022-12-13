board = File.read("input.txt").split("\n").map { |line| line.chars.map(&:to_i) }

## PART 1 ##

$seen_arr = Array.new(board.length) { Array.new(board.length) {0} }

def check(tree, biggest, seen)
    if tree > biggest
      return tree, 1
    else
      return biggest, seen
    end
end

def check_board(board)
  board.each_with_index do |line, x|
    biggest = -1
    line.each_with_index do |tree, y|
      biggest, $seen_arr[x][y] = check(tree, biggest, $seen_arr[x][y])
    end
    biggest = -1
    line.to_enum.with_index.reverse_each do |tree, y|
      biggest, $seen_arr[x][y] = check(tree, biggest, $seen_arr[x][y])
    end
  end
end

check_board(board)
board = board.transpose
$seen_arr = $seen_arr.transpose
check_board(board)

puts $seen_arr.map(&:sum).sum

## PART 2 ##

board = File.read("input.txt").split("\n").map { |line| line.chars.map(&:to_i) }

$values = Array.new(board.length) { Array.new(board.length) {1} }

board.each_with_index do |line, x|
  line.each_with_index do |tree, y|

    seen = 0
    (y - 1).downto(0) do |i|
      seen += 1
      break if board[x][i] >= tree
    end
    $values[x][y] *= seen

    seen = 0
    (y + 1).upto(board.length - 1) do |i|
      seen += 1
      break if board[x][i] >= tree
    end
    $values[x][y] *= seen

    seen = 0
    (x - 1).downto(0) do |i|
      seen += 1
      break if board[i][y] >= tree
    end
    $values[x][y] *= seen

    seen = 0
    (x + 1).upto(board.length - 1) do |i|
      seen += 1
      break if board[i][y] >= tree
    end
    $values[x][y] *= seen

  end
end

puts $values.map(&:max).max

