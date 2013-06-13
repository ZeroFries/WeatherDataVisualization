data = File.open("./data.txt", 'r')
divs_file = File.open("./divs.txt", 'w')
PIXELS_PD = 10

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
	divs_file.write "<div id=\"year_container\">\n" + 
		"		<div class=\"max\" style=\"height: #{temps[0]*PIXELS_PD}px;\"></div>\n" +
		"		<div class=\"mean\" style=\"height: #{temps[1]*PIXELS_PD}px;\"></div>\n" +
		"		<div class=\"min\" style=\"height: #{temps[2]*PIXELS_PD}px;\"></div>\n</div>\n"
end