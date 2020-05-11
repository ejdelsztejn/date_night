class Node
  attr_reader :rating, :movie_title
  attr_accessor :left, :right

  def initialize(rating, movie_title)
    @rating = rating
    @movie_title = movie_title
    @left = nil
    @right = nil
  end
end
