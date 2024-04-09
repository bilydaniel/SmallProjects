module Enumerable

	def my_each
		for element in self do yield element end
		self
	end	


	def my_each_with_index
		i = 0
		while i < self.length do
			yield ([self[i], i])
			i += 1
		end

	end

	def my_select 
		result = []

		self.my_each do |element|
			if yield(element)
				result.push element
			end
		end
		return result
	end

	def my_all?
		
		self.my_each do |element|
			result = yield element 
				if !result
					return false
				end
		end
		return true		

	end

	def my_any?
		
		self.my_each do |element|
			result = yield element 
				if result
					return true
				end
		end
		return false		

	end

	def my_none?
		
		self.my_each do |element|
			result = yield element 
				if result
					return false
				end
		end
		return true		

	end

	
	def my_count arg = "default"

		if block_given?
			sum = 0
			self.my_each do |element|
				if yield(element)
					sum += 1
				end

			end
			return sum
		
		elsif arg != "default"
			sum = 0
			self.my_each do |element|
				if arg == element
					sum +=1
				end
			end
			return sum
		elsif arg == "default"
			return self.length 
		end

	end


	def my_map 
		result = []
		self.my_each do |element|
			result.push(yield element)
		end
		return result

	end


	def my_inject (first_value = 0)
		result = 0
		if first_value != 0
			result = first_value
		else
			result = self[0]
		end

		self.my_each do |x|
			 yield(result, x)
		end
			 result
	end

end





