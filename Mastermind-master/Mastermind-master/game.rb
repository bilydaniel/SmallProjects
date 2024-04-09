require 'colorize'

$red = "R".red
$green = "G".green
$yellow = "Y".yellow
$blue = "B".blue
$magenta = "M".magenta
$cyan = "C".cyan

class Game
	attr_accessor :remaining_turns
	attr_accessor :guesser


	def initialize

		@remaining_turns = 12
		@secret_code = generate_code()
		introduction()

		if get_info == "guess"
			@guesser = "player"
		else
			@guesser = "computer"
		end

	end



	def get_info()
		puts "code Guesser or code creator?[guess/create]"
		input = gets.chomp
		input.downcase!
		
		if (input == "guess" || input == "create")
			return input
		else
			get_info()
		end

		
	end

	def generate_code
		@colors = ["R", "G", "Y", "B", "M", "C"]
		code = ""

		4.times do 
			code << (@colors[rand(6)])
		end
		return code
	end

	def introduction()


		puts "Available colors: "+"(R)ed ".red + 
		"(G)reen ".green + "(Y)ellow ".yellow + 
		"(B)lue ".blue + "(M)agenta ".magenta + 
		"(C)yan ".cyan
	end

	def turn 
		puts "Number of tries left: " + @remaining_turns.to_s 
		puts "Choose 4 colors from #{$red} #{$green} #{$yellow} #{$blue} #{$magenta} #{$cyan}" 
		input = gets.chomp
		color_check = @colors.join("")
		if input =~ /[r|g|y|b|m|c]{4}/i  && input.length == 4
			feedback = compare (input)

			puts "\t------------------"
			puts"\t|Input: #{input}|"
			puts"\t|Feedback: #{feedback}|"
			puts"\t------------------"

			if feedback == "win"
				exit
			end
			@remaining_turns -= 1

		else
			puts "WRONG INPUT ,SON"
			turn()
		end
	end

	def compare input
		#two arrays, one for exact, second for same colors, then put them together
		input.upcase!
		if input == @secret_code
			puts "You have won"
			return "win"
		end
	
		feedback_correct = []
		feedback_contains = []
		feedback_incorrect = []
		feedback = []

		4.times do |i|
			if input[i] == @secret_code[i]
				feedback_correct[i] = "*".green
				input[i] = "0"
				
			end
			 
		end

		4.times do |i|
			if @secret_code.include?(input[i])
				feedback_contains[i] = "*".white
				
			else
				feedback_contains[i] = "*".red
				 
			end
		end

		

		4.times do |i|
			
			if !feedback_correct[i].nil?
				feedback_contains[i] = feedback_correct[i]
			end
		end

		
		return feedback_contains.join("")
	end


	def new_guess(code_guess, feed)
		4.times do |i|
			if feed[i] == "0"	
				next
			else
				new_color = @colors[rand(6)]
					if new_color == code_guess[i]
						redo
					end
				code_guess[i] = new_color 
			end
		end
		return code_guess

	end




	def computer_guess
		puts "Enter your code, computer promises he won't look"
		input = gets.chomp
		input.downcase!

		if input =~ /[r|g|y|b|m|c]{4}/i  && input.length == 4
			code_guess = []

			4.times do
				code_guess.push(@colors[rand(6)])
			end
			12.times do
				puts "Your code is #{input}"
				puts "Computers guess is #{code_guess.join("")}"
				puts "enter 0 for correct position and color, 1 for correct color, and 2 for incorrect"
				feed = gets.chomp
				code_guess = new_guess(code_guess, feed)
			end

		else
			puts "WRONG INPUT"
			computer_guess()
		end
	end


end



game = Game.new

if game.guesser == "player"
	12.times do
		game.turn()
	end
else
	game.computer_guess()
end