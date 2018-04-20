class Bitmap_storage_array

	def initialize(width, length)
		@outputArray = []
		i = width 
		while i > 0
			j = length
			subArray = []
			while j > 0
				subArray.push('O')
				j -= 1
			end
			@outputArray.push(subArray)
			i -=1
		end
	end

	def clearArray()
		@outputArray.each_index do |i|
			@outputArray[i].each_index do |j|
				@outputArray[i][j] = "O"
			end
		end	
	end

	def drawVerticalLine(startline, to, from, color)
		if to<from #normal case that y1 is less than y2
			for x in to-1..from-1
				@outputArray[x][startline-1] = color
			end 
		else 
			for x in from-1..to-1
				@outputArray[x][startline-1] = color
			end
		end	
	end

	def drawHorizontalLine(startline, to, from, color)
		if to<from #normal case that x1 is less than x2
			for x in to..from-1
				@outputArray[startline-2][x] = color
			end 
		else 
			for x in from..to-1
				@outputArray[startline-2][x] = color
			end
		end
	end

	def setUpMap(width, length)
		i = width
		while i > 0
			j = length
			subArray = []
			while j > 0
				subArray.push('O')
				j -= 1
			end
			@outputArray.push(subArray)
			i -=1
		end
	end

	def drawPoint(x, y, color)
		if x< 1 or y > @outputArray[1].size
			puts "improper x coordinate on 'L' line "
			return 0
		elsif y < 1  or y > @outputArray.size
			puts "improper y coordinate input on 'L' line"
			return 0
		else 
			@outputArray[y-1][x-1] = color
		end
	end 

	def displayBitMap()
		puts @outputArray.map{|x| x.join('')}		
		puts "\n"
	end

end