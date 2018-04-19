class BitmapEditor

	def run(file)
		@outputArray = [] 
		width = 0
		length = 0
		return puts "please provide correct file" if file.nil? || !File.exists?(file)

		File.open(file).each do |line|
			
			subline = line.split
			case subline[0]
				##Handles inital setup for "I" inputs 
				when 'i', 'I'
					width = subline[2].to_i
					length = subline[1].to_i
					handleI(width, length)
				##handling "L" case 

				when 'l', 'L'
					if line.include? "-" #possibly move this out to different area 
						puts "negative number detected"
						return 0
					else 
						handleL(subline[1].to_i,subline[2].to_i, subline[3], width, length)
					end


				##handling "C" case 

				when 'c', 'C'
					clearArray()

				##Handling "V" case 
				when 'v', 'V'
					#puts 'test'
					handleV(subline[1].to_i,subline[2].to_i, subline[3].to_i, subline[4]) 
					
=begin
				##Handling "H" case
				when 'h', 'H'
					if subline[2].to_i<subline[3].to_i #normal case that x1 is less than x2
						for x in subline[2].to_i..subline[3].to_i-1
							outputArray[subline[1].to_i-2][x] = subline[4]
						end 
					else 
						for x in subline[3].to_i..subline[2].to_i-1
							outputArray[subline[1].to_i-2][x] = subline[4]
						end
					end
=end
				when 's', 'S'
					handleS
					
=begin

				else
					puts 'unrecognised command :(' 
=end
				
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

	def handleV(startline, to, from, color)
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

	def handleI(width, length)
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

	def handleL(x, y, color, width, length)
		if x< 1 or y > width 
			puts "improper x coordinate on 'L' line "
			return 0
		elsif y < 1  or y > length 
			puts "improper y coordinate input on 'L' line"
			return 0
		else 
			@outputArray[y-1][x-1] = color
		end
	end 


	def handleS()
		puts @outputArray.map{|x| x.join('')}		
	end

end
