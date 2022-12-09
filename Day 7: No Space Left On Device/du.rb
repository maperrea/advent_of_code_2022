input = File.read("input.txt").split("\n")

class MyFs
	attr_accessor :is_directory
	attr_accessor :size
	attr_accessor :name
	attr_accessor :children
	attr_accessor :parent

	def initialize(is_directory: false, size: 0, name: '', parent: nil)
		@is_directory = is_directory
		@size = size.to_i
		@name = name
		@parent = parent
		@children = Hash.new
	end

	def to_s(depth: 0)
		if children
			return ("\t" * depth) + @name + " " + @size.to_s + "\n" + children.map{ |k, v| v.to_s(depth: depth + 1) }.join()
		else
			return @name
		end
	end

end

root = MyFs.new(is_directory: true, name: 'root')

current = root

input.each do |line|
	line = line.split(' ')
	case line[0]
	when '$'
		case line[1]
		when 'cd'
			case line[2]
			when '/'
				current = root
			when '..'
				current = current.parent
			else
				current = current.children[line[2]]
			end
		when 'ls'
			next
		end
	when 'dir'
		current.children[line[1]] = MyFs.new(is_directory: true, size: 0, name: line[1], parent: current)
	else
		current.children[line[1]] = MyFs.new(is_directory: false, size: line[0], name: line[1], parent: current)
	end
end

@total = 0
@directory_sizes = []

def calculate_sizes(current)
	case current.is_directory
	when false
		return current.size
	when true
		current.size = current.children.map { |k, v| calculate_sizes(v) }.sum
		if current.size <= 100000
			@total += current.size
		end
		@directory_sizes += [current.size]
		return current.size
	end
end

calculate_sizes(root)
puts root
puts @total

@directory_sizes.sort!
to_empty = 30000000 - (70000000 - root.size)

puts @directory_sizes.find { |i| i >= to_empty }
