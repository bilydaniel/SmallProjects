require_relative 'board'
require_relative 'player'

class Game
	attr_accessor :board
	
	def initialize
			
		getInformations

		@board = Board.new
		
		@turn_number = 1

	end

	def getInformations
		puts "Name of the first player: "
		player_name = gets.chomp
		puts "Stone of the first player: "
		stone = gets.chomp
		@player1 = Player.new(player_name, stone)

		puts "Name of the second player: "
		player_name = gets.chomp
		puts "Stone of the second player: "
		stone = gets.chomp
		@player2 = Player.new(player_name, stone)

	end

	def turn
		if @turn_number % 2 != 0
			@player = @player1
		else
			@player = @player2
		end

		puts ""
		puts "#{@player.to_s}'s turn (turn number:#{@turn_number})"
		puts "What is your next move"

		return_value = @board.putStone(gets.chomp, @player.stone)
		if return_value == "Error"
			puts "WRONG MOVE"
			turn
		else
			@turn_number += 1	
		end
		

		
	end

	def checkWin()
		winning_row = [@player.stone,@player.stone,@player.stone]

		winning_conditions = [
								[board.tiles[:a1], board.tiles[:a2], board.tiles[:a3]],
								[board.tiles[:b1], board.tiles[:b2], board.tiles[:b3]],
								[board.tiles[:c1], board.tiles[:c2], board.tiles[:c3]],
								[board.tiles[:a1], board.tiles[:b1], board.tiles[:c1]],
								[board.tiles[:a2], board.tiles[:b2], board.tiles[:c2]],
								[board.tiles[:a3], board.tiles[:b3], board.tiles[:c3]],
								[board.tiles[:a1], board.tiles[:b2], board.tiles[:c3]],
								[board.tiles[:c1], board.tiles[:b2], board.tiles[:c3]]
								]

		winning_conditions.each do |row|
			if winning_row == row
				@board.paint()
				puts "#{@player} WINS"
				exit

			end
		end

		puts [@board.tiles[:a1],@board.tiles[:a2]].to_s

	end



end

game = Game.new()



while game.board.tiles.values.include?(" ") do 
	game.board.paint()
	game.turn()	
	game.checkWin()
end

game.board.paint()
puts "ITS A DRAW"


