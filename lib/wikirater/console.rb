require 'readline'
require 'wikirater/comparer'

class Console

  def initialize
    comparer = Comparer.new(reader)
    @rating = comparer.compare
    @difficult_words = comparer.non_matching_words
  end

  def reader
    puts "Enter a search term to see how difficult the wikipedia article is to read:"
    Readline.readline("> ", true)
  end

  def display
    puts "*" * calculate_level(@rating)
    puts "#{@rating}% level of difficulty"
    puts "Some difficult words include:"
    puts @difficult_words.uniq.sample(10)
  end

private
  def calculate_level(rating)
    case @rating
    when 0..20 then 1
    when 21..25 then 2
    when 26..30 then 3
    when 31..35 then 4
    when 36..100 then 5
    end
  end
end