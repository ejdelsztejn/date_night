require './lib/node'

class BinarySearchTree
  attr_accessor :root_node

  def initialize
    @root_node = nil
  end

  def insert(rating, movie_title)
    # still need to prevent addition of non-unique ratings
    if root_node.nil?
      @root_node = Node.new(rating, movie_title)
      0 # node depth
    else
      insert_node(root_node, rating, movie_title, node_depth = 1)
    end
  end

  def insert_node(node, rating, movie_title, node_depth)
    if rating > node.rating
      if node.right
        insert_node(node.right, rating, movie_title, node_depth += 1)
      else
        node.right = Node.new(rating, movie_title)
        node_depth
      end
    else
      if node.left
        insert_node(node.left, rating, movie_title, node_depth += 1)
      else
        node.left = Node.new(rating, movie_title)
        node_depth
      end
    end
  end

  def include?(rating)
    if root_node.rating == rating
      true
    else
      include_node(root_node, rating)
    end
  end

  def include_node(node, rating)
    if node == nil
      false
    elsif rating > node.rating
      include_node(node.right, rating)
    elsif rating < node.rating
      include_node(node.left, rating)
    elsif node.rating == rating
      true
    end
  end

  def depth_of?(rating)
    
  end
end
