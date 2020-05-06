require './lib/node'

class BinarySearchTree
  attr_accessor :root_node

  def initialize
    @root_node = nil
  end

  def insert(rating, movie_title)
    if root_node.nil?
      @root_node = Node.new(rating, movie_title)
    else
      insert_node(root_node, rating, movie_title)
    end
  end

  def insert_node(node, rating, movie_title)
    if rating > node.rating
      if node.right
        insert_node(node.right, rating, movie_title)
      else
        node.right = Node.new(rating, movie_title)
      end
    else
      if node.left
        insert_node(node.left, rating, movie_title)
      else
        node.left = Node.new(rating, movie_title)
      end
    end
  end

end
