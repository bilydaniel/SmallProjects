class LinkedList
	attr_accessor :head, :tail

	def initialize
		
	end

	def append
		if @tail.nil?
			first_node
		else
			@tail.next_node = Node.new 	
		end
	end

	def prepend
		if @head.nil?
			first_node
		else
			new_node = Node.new
			new_node.next_node = @head
			@head = new_node
		end
		
		
	end	

	def first_node
		new_node = Node.new
		@head = new_node
		@tail = new_node
	end

	def size
		return 0 if head == nil
		
		tmp = @head
		number_of_nodes = 0
		while tmp != nil do
			tmp = tmp.next_node
			number_of_nodes += 1
		end
		return number_of_nodes

		
	end
	
	def at(index)
		return nil if @head.nil?
		if index >= self.size
			return "The list is not that big"
		end
		tmp = @head

		index.times do 
			tmp = tmp.next_node
		end
		return tmp
	end

	def pop
		prev = nil
		curr = @head

		while curr != @tail do
			prev = curr
			curr = curr.next_node
		end

		@tail = prev
		@tail.next_node = nil

	end

	def contains? (value)
		if @head.nil?
			return false
		else
			tmp = @head
			while tmp != nil do
				if tmp.value == value
					return true
				end

				tmp = tmp.next_node
			end

			return false

		end

	end

	def find(data)
		if @head.nil?
			return nil
		else
			tmp = @head
			index = 0
			while tmp != nil do
				if tmp.value == data
					return index
				end
				index += 1 
				tmp = tmp.next_node
			end
			return nil
		end
		
	end

	def to_s
		if @head.nil?
			return "nil"
		else
			tmp = @head
			while tmp != nil do 
				print "( #{tmp.value} ) -> "
				tmp = tmp.next_node
			end
			print "nil"
		end
	end
end

class Node
	attr_accessor :value, :next_node

	def initialize
		@value = nil
		@next_node = nil
	end

	

end

list = LinkedList.new
node = Node.new
node.value = 6
list.head = node

list.head.value = 6
node = Node.new
node.value = 69
list.head.next_node = node

puts list.find(69)
puts list.contains?(6)
puts list.head.value

puts list.to_s
