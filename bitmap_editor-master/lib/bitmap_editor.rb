require_relative 'bitmap_storage_array.rb'
class BitmapEditor

	def run(file)
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
						@output = Bitmap_storage_array.new(subline[2].to_i, subline[1].to_i)
					when 'l', 'L' 
						@output.drawPoint(subline[1].to_i,subline[2].to_i, subline[3])
					when 'c', 'C'
						@output.clearArray()
					when 'v', 'V'
						@output.drawVerticalLine(subline[1].to_i,subline[2].to_i, subline[3].to_i, subline[4]) 
					when 'h', 'H'
						@output.drawHorizontalLine(subline[1].to_i, subline[2].to_i, subline[3].to_i, subline[4])
					when 's', 'S'
						@output.displayBitMap
					else
						puts 'unrecognised command :(' 
				end
			else 
				next
			end 
		end 
	end
end
