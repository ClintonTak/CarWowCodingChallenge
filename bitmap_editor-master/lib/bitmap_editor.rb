class BitmapEditor

	def run(file)
		@outputArray = [] 
		properSetUpFlag = false; 
		return puts "please provide correct file" if file.nil? || !File.exists?(file)

		File.open(file).each do |line|
			if line.include? "-"
			   puts "negative number detected, please check input array" 
			   return 0
			end
			subline = line.split
			if subline[0] == 'i' or subline[0] == 'I'
				properSetUpFlag = true; #tests to make sure that the grid has been properly set up first 
			end
			if properSetUpFlag == true
				case subline[0] 
					when '#', '/' #adds support for comments in the test file, must start with # and be followed by a space 
						next
					when 'i', 'I'
						setUpMap(subline[2].to_i, subline[1].to_i)
					when 'l', 'L' 
						drawPoint(subline[1].to_i,subline[2].to_i, subline[3])
					when 'c', 'C'
						clearArray()
					when 'v', 'V'
						drawVerticalLine(subline[1].to_i,subline[2].to_i, subline[3].to_i, subline[4]) 
					when 'h', 'H'
						drawHorizontalLine(subline[1].to_i, subline[2].to_i, subline[3].to_i, subline[4])
					when 's', 'S'
						displayBitMap
					else
						puts 'unrecognised command :(' 
				end
			else 
				next
			end 
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
	end

end
