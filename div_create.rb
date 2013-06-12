data = File.open("./data.txt", 'r')
divs_file = File.open("./divs.txt", 'w')

class File
	def add_to_hash(hash)
		# 
		self.each_line do |line| 
			hash[line[0,4]] = line[5,line.size].split(" ")
			hash[line[0,4]].each_with_index { |temp, i| hash[line[0,4]][i] = temp.to_i }
		end
		hash
	end
end

data_hash = {}
data_hash = data.add_to_hash(data_hash)