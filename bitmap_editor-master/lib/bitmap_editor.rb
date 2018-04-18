class BitmapEditor

	def run(file)
		return puts "please provide correct file" if file.nil? || !File.exists?(file)

		File.open(file).each do |line|
			
			line = line.downcase #lowercase for better input handling 
			line = line.gsub(/\s+/, "")#removing whitespace for better parsing 
			#puts line
			#puts line[0]
			outputString = ""
			case line[0]
			when 'i'
				width = line[1].to_i
				while width > 0
					length = line[2].to_i
					while length > 0
						outputString.concat('0')
						length -= 1
					end
					outputString.concat("\n")
					width -=1
				end
=begin
			when 's'
				puts "There is no image"

			else
				puts 'unrecognised command :(' 
=end
			print outputString
			end 
		end
	end
end
