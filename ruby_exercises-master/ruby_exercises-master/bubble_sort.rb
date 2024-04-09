
=begin
def bubble_sort arr
	swapped = true

	while swapped do 
		swapped = false
		
		arr.each_with_index do |element, index|
			if (index != (arr.length-1)) && (element > arr[index + 1]) 
				arr[index], arr[index + 1] = arr[index + 1], arr[index]
				
				swapped = true
				puts arr.to_s
			end
		end	
	end
	
	return arr
end

puts bubble_sort([4,3,78,2,0,2])

=end

def bubble_sort_by arr
	
	loop do
		complete = false

		(arr.length - 1).times do |i|
			if yield(arr[i], arr[i+1]) > 0
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				complete = true
			end
		end
		break if !complete

	end
	 puts arr
end

 bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
	 left.length - right.length
end