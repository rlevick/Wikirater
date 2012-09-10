class WikiParser
  attr_reader :words
  
  def parse(content)
    clean_content = clean(content).downcase.split("see also\n")[0]
    words = clean_content.split(" ")
    words.delete_if {|word| word =~ /\d/ || word =~ /http/ || word.length <= 3}
  end

  def clean(content)
    content.chomp.gsub(/[|!?\[\]\-\(\)\'<>="{}\.\\\/\:,*;#_&]/, " ")
  end
end