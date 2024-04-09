
class Node
	attr_accessor :value, :parent, :left_child, :right_child

	def initialize

	end
	
end

class BinaryTree
	attr_accessor :root

	def initialize(values)

		if values.length < 1
			return "error"
		end
		build_tree(values)
	end

	def build_tree(values)
		values.each do |value|
			insert_node(value)
		end
	end

	def insert_node(value)
		new_node = Node.new
		new_node.value = value
		
		if root.nil?
			@root = new_node
		else
			curr = @root
			prev = nil
			

		while curr != nil do
			prev = curr
			
			if value > curr.value
					 curr = curr.right_child
			else
				curr = curr.left_child
			end			
		end

		if value > prev.value
			prev.right_child = new_node

		else
			prev.left_child = new_node
		end

		new_node.parent = prev

		end
	end

	def visualize_tree(head)
	  array_curent = [head]

	  loop do
	    array_children = []
	    print "["
	    array_curent.each do |node|
	      print " #{ node.nil? ? "." : node.value } "
	      array_children << (node.nil? ? nil : node.left_child)
	      array_children << (node.nil? ? nil : node.right_child)
	    end
	    puts "]"
	    array_curent = array_children.dup
	    break if array_curent.all? { |node| node.nil?  }
	    # break if array_curent.size > 32
		end
	end

	def breadth_first_search(target)
		queue = [@root]

		while queue.any? do
			tmp = queue[0]
			
			return tmp if tmp.value == target
			
			queue.push(tmp.left_child) if !tmp.left_child.nil?
			queue.push(tmp.right_child) if !tmp.right_child.nil?
			
			queue.shift()
		end

		return nil

	end

	def depth_first_search(target)
		stack = [@root]

		while stack.any? do 
			tmp = stack[0]

			return tmp if tmp.value == target
			stack.shift()

			stack.unshift(tmp.left_child) if !tmp.left_child.nil?
			stack.unshift(tmp.right_child) if !tmp.right_child.nil?


		end

		return nil

	end

	def dfs_rec(target, current_node)

		current_node = @root if current_node.nil?
		
		if current_node.value == target
			puts "CURR: #{current_node.value}"
			return current_node
		end

		

				

		if !current_node.left_child.nil?
		 	left = dfs_rec(target, current_node.left_child)
		end
		return left if left != nil

		if !current_node.right_child.nil?
			right = dfs_rec(target, current_node.right_child)
		end	
		return right if right != nil
		


	end
end


#tree = BinaryTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree = BinaryTree.new([2, 1, 3])
#tree = BinaryTree.new([2,1,3,4,5])
#puts tree.root.right_child.right_child.right_child.value
tree.visualize_tree(tree.root)

puts node = tree.breadth_first_search(1)
puts node.value

puts node = tree.depth_first_search(1)
puts node.value

puts node = tree.dfs_rec(2, nil)
puts node.value