require './lib/node'

class BinarySearchTree
  def initialize(value, movie_title)
    @root_node = Node.new(value, movie_title)
  end
end
