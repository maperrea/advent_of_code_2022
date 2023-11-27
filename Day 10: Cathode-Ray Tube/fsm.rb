require 'scanf'

class Fsm

	def initialize(file)
		@operations = File.read(file).split("\n").map { |line| line.scanf '%s %d' }
	    @cycle = 1
	    @reg = 1
        @to_add = 0
	end

	def exec

		op = @operations.shift()
       # p op

        if (@cycle - 1) % 40 >= @reg - 1 && (@cycle - 1) % 40 <= @reg + 1 
          print '#'
        else
          print '.'
        end 
        
		if op[0] == "addx"
          @operations.unshift(['add0', op[1]])
        elsif op[0] == 'add0'
          @reg += op[1]
		end

		@cycle += 1

        if @cycle % 40 == 1
          puts
        end

	end

    def exec_until(cycle)
      while @cycle != cycle
        exec()
      end
      return @reg
    end

end

fsm = Fsm.new('input.txt')

#puts 20 * fsm.exec_until(20)
#puts 60 * fsm.exec_until(60)
#puts 100 * fsm.exec_until(100)
#puts 140 * fsm.exec_until(140)
#puts 180 * fsm.exec_until(180)
#puts 220 * fsm.exec_until(220)
#
#fsm = Fsm.new('input.txt')
#
#puts 20 * fsm.exec_until(20) + 60 * fsm.exec_until(60) + 100 * fsm.exec_until(100) + 140 * fsm.exec_until(140) + 180 * fsm.exec_until(180) + 220 * fsm.exec_until(220)

fsm.exec_until(241)
