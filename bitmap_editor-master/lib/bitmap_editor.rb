class BitmapEditor

	def run(file)
		outputString = ""
		outputArray = [] 
		width = 0
		length = 0
		return puts "please provide correct file" if file.nil? || !File.exists?(file)

		File.open(file).each do |line|
			
			line = line.downcase #lowercase for better input handling 
			line = line.gsub(/\s+/, "")#removing whitespace for better parsing 

			case line[0]
				##Handles inital setup for "I" inputs 
				when 'i'
					width = line[1].to_i
					length = line[2].to_i
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
						outputArray.push(subArray)
						i -=1
					end
				##handling "L" case 
				when 'l'
					if line.include? "-" #possibly move this out to different area 
						puts "negative number detected"
						return 0
					elsif line[1].to_i < 1 or line[1].to_i > width 
						puts "improper x coordinate on 'L' line "
						return 0
					elsif line[2].to_i < 1  or line[2].to_i > length 
						puts "improper y coordinate input on 'L' line"
						return 0
					else 
						outputArray[line[1].to_i-1][line[2].to_i-1] = line[3]
					end
				##handling "C" case 
				when 'c'
					outputArray.each_index do |i|
						outputArray[i].each_index do |j|
							outputArray[i][j] = "O"
						end
					end


				


				when 's'
					#print outputString
					puts outputArray.map{|x| x.join('')}
=begin

				else
					puts 'unrecognised command :(' 
=end
				
			end 
		end 
		
	end
end
