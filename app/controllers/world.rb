class World

	def initialize(grid)
		@result = lifegame(grid)
	end
	
	def each(&block)
     @result.each(&block)
	end

	def print(grid)
		return grid.map { |x| x.join(' ').gsub("1","*").gsub("0",".") }
	end
		
	def lifegame(grid)
		alive = 1
		die = 0
		count = 1
		res = []
		while not lifeless(grid, alive) || count == 100
			puts "Generazione " + count.to_s
			puts print(grid)
			res.push(print(grid))
			puts "\n"
			next_round = update(grid, alive, die)
			if next_round == grid
				return res
				break
			end
			grid = next_round
			count = count +1
		end
		return res
	end

	def lifeless(grid, alive)
		0.upto(grid.length-1) do |i|
			0.upto(grid[0].length-1) do |j|
				if(grid[i][j] == alive)
					return false
				end
			end
		end
		
		return true
	end

	def update(grid, alive, die)
		next_round = Array.new(grid.length){Array.new(grid[0].length, die)}
		0.upto(grid.length-1) do |i|
			0.upto(grid[0].length-1) do |j|
				next_round[i][j] = evolve(grid, i, j, alive, die)
			end
		end
		return next_round
	end

	def evolve(grid, i, j, alive, die)
		directions = [[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
		t = 0
		directions.each do |direction|
			if (i+direction[0] >= 0 and i+direction[0] < grid.length and j+direction[1] >= 0 and j+direction[1] < grid[0].length)
				if(grid[i+direction[0]][j+direction[1]] == alive)
					t += 1
				end
			end
		end
		if((grid[i][j] == alive and (t < 2 or t > 3)) or (grid[i][j] == die and t != 3))
			return die
		else
			return alive
		end
	end	
end
