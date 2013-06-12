data = File.open("./data.txt", 'r')
divs_file = File.open("./divs.txt", 'w')
PIXELS_PD = 2

class File
	def add_to_hash(hash)
		# add weahter data to a hash, with the year as key, and the value an array of the three temps
		self.each_line do |line| 
			hash[line[0,4]] = line[5,line.size].split(" ")
			hash[line[0,4]].each_with_index { |temp, i| hash[line[0,4]][i] = temp.to_i }
		end
		hash
	end
end

data_hash = {}
data_hash = data.add_to_hash(data_hash)

data_hash.each do |year, temps|
	divs_file.write "<div class=\"year\" style=\"margin-left=#{(2013-year.to_i)*6}px;\">" + 
		"<div class=\"min\" style=\"margin-bottom=#{temps[2]*PIXELS_PD}px;\">#{temps[2]}</div>" +
		"<div class=\"mean\" style=\"margin-bottom=#{temps[1]*PIXELS_PD}px;\">#{temps[1]}</div>" +
		"<div class=\"max\" style=\"margin-bottom=#{temps[0]*PIXELS_PD}px;\">#{temps[0]}</div>\n"
end