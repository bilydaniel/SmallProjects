require_relative 'board'

class Game
	attr_accessor :board, :current_player

	def initialize
		if false #intro() TODO
			puts "Loading..."
			@board = Board.load()
			
		else
			puts "Creating a new game..."
			puts ""
			@board = Board.new
		end

			message()
			@current_player = "white"	
			play()
	end

	def message()
		puts "type coordinates from(YX), to (YX) [00 02]"
		puts "white goes first"
	end

	def intro()
		puts "type 'load' for loading a saved game, 'new' for new game"
		decision = gets.chomp

		if decision == "load"
			return true
		elsif decision == "new"
			return false
		else
			"WRONG INPUT"
			intro()
		end


	end

	def play()
		while win? do
			@board.draw_board()
			input = take_input()
			next if input.nil?

			next if make_move(input).nil?
			
		end

	end

	def make_move(input)
		from_to = input.split(" ")
		from = from_to[0].split("")
		to = from_to[1].split("")

		if from == to
			puts "Wrong input, from and to coordinates are the same, try again"
			return
		end
		
		square_from = @board.squares[from[0].to_i][from[1].to_i]
		square_to = @board.squares[to[0].to_i][to[1].to_i]

		if square_from.ocupant.is_a?(Tile)
			puts "the is no chess piece, try again"
			return
		end
		
		if square_from.ocupant.color != @current_player
			puts "thats not your piece, try again"
			return
		end 

		square_from.ocupant.find_moves(@board)
		
		#converting strings to integers
		to = to.collect{|i| i.to_i}
		
		
		if !square_from.ocupant.legal_moves.include?(to)
			puts "This piece cannot make that move, try again"
			return
		end

		#square_to.ocupant, square_from.ocupant = square_from.ocupant, square_to.ocupant
		square_from.ocupant.coordinates = to
		square_to.ocupant = square_from.ocupant

		square_from.ocupant = Tile.new


		#TODO add all the possible moves to the pieces, if piece contains the input move,
		# its correct(check other shit like if the tile is empty etc.)

		#puts "TEST #{@board.squares[5][5].ocupant.is_a?(Tile)}"
	end

	def win?()
		return true
	end

	def take_input()
		puts ""
		input = gets.chomp()
		if !input.match(/^\d\d \d\d$/) 
			puts "WRONG INPUT, try again"
			return

		end
		return input 
	end

end

game = Game.new()