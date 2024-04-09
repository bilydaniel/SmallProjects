class Board
	attr_reader :tiles

	def initialize
		@tiles = {a1: ' ', a2: ' ', a3: ' ', 
				b1: ' ', b2: ' ', b3: ' ', 
				c1: ' ', c2: ' ', c3: ' '}
	end

	def paint
		puts " |1|2|3|"
		puts "A|#{@tiles[:a1]}|#{@tiles[:a2]}|#{@tiles[:a3]}|"
		puts "B|#{@tiles[:b1]}|#{@tiles[:b2]}|#{@tiles[:b3]}|"
		puts "C|#{@tiles[:c1]}|#{@tiles[:c2]}|#{@tiles[:c3]}|"
	end

	def putStone(coordinates, stone)
		coordinates.downcase!

		if @tiles.include?(coordinates.to_sym) && @tiles[coordinates.to_sym] == " "
			@tiles[coordinates.to_sym] = stone 
		else
			return "Error"
		end
	end

end


