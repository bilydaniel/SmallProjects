class Player
	attr_accessor :name
	attr_accessor :stone
	
	def initialize (name, stone)
		@name = name
		@stone=stone
	end

	def to_s
		return @name.to_s
	end


end