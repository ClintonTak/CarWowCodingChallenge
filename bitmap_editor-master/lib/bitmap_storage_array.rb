class Bitmap_storage_array

	def initialize(width, length)
		@width = width
		@length = length
		@outputArray = []
		i = width
		while i > 0
			j = length
			subArray = []
			while j > 0
				#outputString.concat('0')
				subArray.push('O')
				j -= 1
			end
			#outputString.concat("\n")
			@outputArray.push(subArray)
			i -=1
		end
		
	end

	def push(item)
		@outputArray.push(item)
	end


	def width
		@width
	end

	def length
		@length
	end

end