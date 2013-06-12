require 'rubygems'
require "nokogiri"
require "open-uri"

file = File.open("./data.txt", 'w')
temp = ""
 
2013.downto(1995) do |year|
	url = "http://www.wunderground.com/history/airport/CYTZ/#{year}/6/12/WeeklyHistory.html"
	page = Nokogiri::HTML(open(url))
	(0..2).each do |i|
		temp = page.css("#historyTable").css(".b")[i*3 + 1].text
		file.write("#{year} ")
	  file.write(temp + " ") if !temp.nil? && !temp.empty?
	end
  file.write("\n")
end