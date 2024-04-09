require_relative 'pieces'

class Board
	attr_accessor :squares

	def initialize 
		init_squares()
		init_pieces()
		
	end

	def init_squares()
		@squares = Array.new(8){Array.new(8)}
		
		8.times do |i|
			8.times do |j|
				@squares[i][j] = Square.new(i,j)
			end
		end
	end

	def init_pieces()
		8.times do |i|
			@squares[1][i].ocupant = Pawn.new([1,i], "black")
		end

		8.times do |i|
			@squares[6][i].ocupant = Pawn.new([6,i], "white")
		end

		@squares[7][0].ocupant = Rook.new([7,0], "white")
		@squares[7][7].ocupant = Rook.new([7,7], "white")
		@squares[0][0].ocupant = Rook.new([0,0], "black")
		@squares[0][7].ocupant = Rook.new([0,7], "black")

		@squares[7][1].ocupant = Knight.new([7,1], "white")
		@squares[7][6].ocupant = Knight.new([7,6], "white")
		@squares[0][1].ocupant = Knight.new([0,1], "black")
		@squares[0][6].ocupant = Knight.new([0,6], "black")

		@squares[7][2].ocupant = Bishop.new([7,2], "white")
		@squares[7][5].ocupant = Bishop.new([7,5], "white")
		@squares[0][2].ocupant = Bishop.new([0,2], "black")
		@squares[0][5].ocupant = Bishop.new([0,5], "black")

		@squares[7][3].ocupant = Queen.new([7,3], "white")
		@squares[0][3].ocupant = Queen.new([0,3], "black")

		@squares[7][4].ocupant = King.new([7,4], "white")
		@squares[0][4].ocupant = King.new([0,4], "black")
		
	end

	def draw_board()
		8.times do |i|
			print "#{i} " 
			8.times do |j|
				print "#{@squares[i][j].ocupant.image}"
			end
			puts ""
		end
		
		puts "  0 1 2 3 4 5 6 7"
	end

	def save
		File.open("save.dat","w") do |file|
			file.puts Marshal::dump(self)
		end
	end

	def self.load 
		Marshal::load(File.read("save.dat"))
	end
end

class Square
	attr_accessor :coordinates, :ocupant

	def initialize(x,y)
		@ocupant = Tile.new
		@coordinates = [x,y]
	end
end