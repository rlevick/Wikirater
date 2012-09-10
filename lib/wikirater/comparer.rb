require 'wikirater/parser'
require 'wikirater/requester'
require 'wikirater/common_words'

class Comparer
  attr_reader :non_matching_words
  
  def initialize(query)
    @common_words = CommonWords.grab_words
    @wiki_words = WikiParser.new.parse(Requester.new.get_content(query))
  end

  def compare
    @non_matching_words = @wiki_words.select do |word|
      !(@common_words.include?(word))
    end
    ((@non_matching_words.count.to_f/@wiki_words.count)*100).to_i
  end
end