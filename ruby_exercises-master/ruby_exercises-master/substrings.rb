def substrings(word, subwords)

	result = Hash.new(0)
	word.downcase!
	subwords.each {|subword|
		subword.downcase!

		if word.include? (subword)
			split_word = word.split(" ")
			split_word.each {|w|

				if w.include?(subword)
					result[subword] += 1
				end
			}
			
		end
	}

	
	return result

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


puts substrings("Howdy partner, sit down! How's it going?", dictionary)