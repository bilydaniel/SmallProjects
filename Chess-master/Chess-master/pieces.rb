class Tile
	attr_accessor :image

	def initialize
		@image = "\u2610 "
	end
end


class Pawn
	attr_accessor :coordinates, :color, :legal_moves, :image, :board  
	
	def initialize(coordinates, color)
		@coordinates = coordinates
		@color = color
		@image = "\u265f " if @color == "white"
		@image = "\u2659 " if @color == "black"
	end

	def find_moves(board)
		@board = board
		@legal_moves = []


		#TODO add the double jump at the start

		if @color == "white"
			forward = [@coordinates[0]-1, @coordinates[1]]
			left = [@coordinates[0]-1, @coordinates[1]-1]
			right = [@coordinates[0]-1, @coordinates[1]+1]
			#forward
			@legal_moves.push([@coordinates[0]-1, @coordinates[1]]) if @board.squares[forward[0]][forward[1]].ocupant.is_a?(Tile)
			#left(attack)
			
			#right(attack)
			
			@legal_moves.push(left) if !@board.squares[left[0]][left[1]].ocupant.is_a?(Tile)
			@legal_moves.push(right) if !@board.squares[right[0]][right[1]].ocupant.is_a?(Tile)
			
			#puts "MOVES #{@legal_moves}"
			#move
			#if coordinates[0]
			#attack

		elsif @color == "black"

		end
	end

end

class Rook
	attr_accessor :coordinates, :color, :legal_moves, :image  
	
	def initialize(coordinates, color)
		@coordinates = coordinates
		@color = color
		@image = "\u265c " if @color == "white"
		@image = "\u2656 " if @color == "black"
	end
end

class Knight
	attr_accessor :coordinates, :color, :legal_moves, :image  
	
	def initialize(coordinates, color)
		@coordinates = coordinates
		@color = color
		@image = "\u265e " if @color == "white"
		@image = "\u2658 " if @color == "black"
	end
end

class Bishop
	attr_accessor :coordinates, :color, :legal_moves, :image  
	
	def initialize(coordinates, color)
		@coordinates = coordinates
		@color = color
		@image = "\u265d " if @color == "white"
		@image = "\u2657 " if @color == "black"
	end
end

class Queen
	attr_accessor :coordinates, :color, :legal_moves, :image  
	
	def initialize(coordinates, color)
		@coordinates = coordinates
		@color = color
		@image = "\u265b " if @color == "white"
		@image = "\u2655 " if @color == "black"
	end
end

class King
	attr_accessor :coordinates, :color, :legal_moves, :image  
	
	def initialize(coordinates, color)
		@coordinates = coordinates
		@color = color
		@image = "\u265a " if @color == "white"
		@image = "\u2654 " if @color == "black"
	end
end

