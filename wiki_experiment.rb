require 'fileutils'
 require 'tempfile'

t_file = Tempfile.new('ftop_english_words_temp.txt')
File.open("top_english_words.txt", "r+") do |file|
	file.each_line do |line|
		t_file.puts line.gsub(/^\s*/, "")
	end
end
FileUtils.mv(t_file.path, "top_english_words.txt")
