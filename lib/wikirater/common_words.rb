module CommonWords
  def self.grab_words
    raw_words = File.read('common_words.txt')
    @common_words = raw_words.downcase.split("\n")
    all_words = @common_words + add_plurals + add_past_tense + add_gerund
    @common_words + add_plurals + add_past_tense + add_gerund
  end

  def self.add_plurals
    s = @common_words.map {|word| word + "s"}
    es = @common_words.map {|word| word + "es"}
    ies =  @common_words.map do |word|
      if word[word.length-1] == "y"
        new_word = word.chop
        new_word + "ies" 
      end
    end
    s + es + ies
  end

  def self.add_past_tense
    d = @common_words.map {|word| word + "d"}
    ed = @common_words.map {|word| word + "ed"}
    d + ed
  end

  def self.add_gerund
    ing = @common_words.map {|word| word + "ing"}
    eing =  @common_words.map do |word| 
      if word[word.length-1] == "e"
        new_word = word.chop
        new_word + "ing" 
      end
    end
    ing + eing
  end
end