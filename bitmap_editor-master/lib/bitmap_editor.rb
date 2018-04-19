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
=begin
				when 'l', 'L'
					if line.include? "-" #possibly move this out to different area 
						puts "negative number detected"
						return 0
					elsif subline[1].to_i < 1 or subline[1].to_i > width 
						puts "improper x coordinate on 'L' line "
						return 0
					elsif subline[2].to_i < 1  or subline[2].to_i > length 
						puts "improper y coordinate input on 'L' line"
						return 0
					else 
						outputArray[subline[2].to_i-1][subline[1].to_i-1] = subline[3]
					end
				##handling "C" case 
				when 'c', 'C'
					outputArray.each_index do |i|
						outputArray[i].each_index do |j|
							outputArray[i][j] = "O"
						end
					end
				##Handling "V" case 
				when 'v', 'V' 
					if subline[2].to_i<subline[3].to_i #normal case that y1 is less than y2
						for x in subline[2].to_i-1..subline[3].to_i-1
							outputArray[x][subline[1].to_i-1] = subline[4]
						end 
					else 
						for x in subline[3].to_i-1..subline[2].to_i-1
							outputArray[x][subline[1].to_i-1] = subline[4]
						end
					end
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
				

	def handleS()
		puts @outputArray.map{|x| x.join('')}		
	end

end
