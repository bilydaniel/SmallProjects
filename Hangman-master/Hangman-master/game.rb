#FIX SAVING.

class GameHandler

	def initialize
		if load_saved_game?
			@game = Game.load
			@game.play
		else
			@game = Game.new
		end
	end

	def load_saved_game?
		puts "Do you want to load saved file? [y/n]"
		input = gets.chomp
		input.downcase!

		if input == "y"
			return true
		elsif input == "n"
			return false
		else 
			puts "Wrong you scrub"
			load_saved_game?
		end

	end
end

class Game
	attr_accessor :random_word, :word, :tries, :misses


	def initialize
		@misses = []

		@tries = 1
		@random_word = load_random_word("5desk.txt")
		@random_word.downcase!

		@word = []
		random_word.length.times do
		@word.push("_")
		end

			
		play
		
	end



	def save
		File.open("save.dat","w") do |file|
			file.puts Marshal::dump(self)
		end
	end

	def self.load 
		Marshal::load(File.read("save.dat"))
	end

	def play 

		while @tries < 9
			puts "********************************"
			puts "TRIES: #{@tries}/8 "
			puts @word.join(" ").to_s
			puts "Guesses: #{@misses.join(" ").to_s}"
			puts "GUESS! type 'save' for saving the game"
			guess = gets.chomp
			guess.downcase!
			if guess == "save"
				save
				puts "game has been saved"
			end

			if guess.length > 1
				puts "Guess again scrub"
				next
			end

			if @random_word.include? guess
				@random_word.length.times do |i|
					if @random_word[i] == guess
						@word[i] = guess
					end
				end
			else
				@misses.push (guess)		
			end

			if !@word.include?("_")
				puts "You win!"
				exit
			end

			@tries += 1
		end

	puts "You lose"
	puts "The word was #{@random_word}"
	end

	

	def load_random_word(path_to_file)
	contents = File.readlines(path_to_file)

		while(true) do
			random_word = contents[rand(contents.length)]
			random_word.strip!
			
			if random_word.length.between?(5,12)
				return random_word
			end
		end	
	end
end

game = GameHandler.new



