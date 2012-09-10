require 'wikipedia'

class Requester
  include Wikipedia

  def get_content(search_term)
    raise ArgumentError if search_term.nil?
    Wikipedia.find(search_term).content
  end
end