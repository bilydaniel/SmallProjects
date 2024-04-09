def caesar_cipher(message, shift)

	shift = shift % 26
	shifted_message = ""

	message.each_char {|letter|
		ascii = letter.ord
		if ascii.between?(65, 90)
			ascii += shift
			if ascii > 90
				ascii -= 26
			end
		elsif ascii.between?(97, 122)
			ascii += shift
			if ascii > 122
				ascii -= 26
			end
		

		end
		 	 
		
		shifted_message << ascii.chr

	}
	return shifted_message

end





puts caesar_cipher("What a string!",5)

puts "a".ord
puts 98.chr