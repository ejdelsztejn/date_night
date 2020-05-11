require './lib/node'
require 'csv'

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

  def depth_of(rating)
    depth_of_node(root_node, rating, depth = 0)
  end

  def depth_of_node(node, rating, depth)
    if node == nil
      nil
    elsif rating > node.rating
      depth_of_node(node.right, rating, depth += 1)
    elsif rating < node.rating
      depth_of_node(node.left, rating, depth += 1)
    elsif node.rating == rating
      depth
    end
  end

  def max(node = root_node)
    current_max = node.rating
    if node.right
      max(node.right)
    else
      current_max
    end
  end

  def min(node = root_node)
    current_min = node.rating
    if node.left
      min(node.left)
    else
      current_min
    end
  end

  def sort(node = root_node, sorted_array = [])
    sorted_array << Hash[node.movie_title, node.rating]
    if node.right && node.left
      sort(node.right, sorted_array)
      sort(node.left, sorted_array)
    elsif node.right
      sort(node.right, sorted_array)
    elsif node.left
      sort(node.left, sorted_array)
    else
      sorted_array
    end
    sorted_array.reverse!
  end

  def load(file)
    # need to prevent addition of non-unique ratings
    movies = CSV.read(file)
    movie_list = movies.map do |movie|
      insert(movie[0], movie[1].strip)
    end
    movie_list.count
  end

  def health(depth, node = root_node)
    health_array = []
    ratings = rating(depth)
    ratings.each do |node|
      node_array = []
      node_array << node
      node_array << child_nodes
      health_array << node_array
    end
    health_array
  end

  def rating(depth, at_depth = 0, node = root_node, nodes_at_depth = [])
    if at_depth == depth
      nodes_at_depth << node.rating
      nodes_at_depth
    else
      if node.right && node.left
        rating(depth, at_depth += 1, node.right, nodes_at_depth)
        rating(depth, at_depth, node.left, nodes_at_depth)
      elsif node.right
        rating(depth, at_depth += 1, node.right, nodes_at_depth)
      elsif node.left
        rating(depth, at_depth += 1, node.left, nodes_at_depth)
      else
        nodes_at_depth
      end
    end
  end

  def child_nodes(node = root_node, children = 1)
    if node.right && node.left
      require "pry"; binding.pry
      child_nodes(node.right, children += 1)
      child_nodes(node.left, children += 1)
    elsif node.right
      require "pry"; binding.pry
      child_nodes(node.right, children += 1)
    elsif node.left
      require "pry"; binding.pry
      child_nodes(node.left, children += 1)
    else
      children += 1
      require "pry"; binding.pry
      children
    end
  end

  tree2 = BinarySearchTree.new

  tree2.insert(88, "Big Hero 6")
  tree2.insert(65, "Interstellar")
  tree2.insert(91, "The Dark Knight")
  tree2.insert(10, "Master of Disguise")
  # tree2.insert(33, "Jumanji")
  # tree2.insert(56, "Book Club")
  # tree2.insert(85, "Insidious")
  # tree2.insert(100, "Legally Blonde")
  # tree2.insert(7, "Battlefield Earth: A Saga of the Year 3000")

  p tree2.child_nodes
  # def leaves

  # end

  # def height

  # end
end
