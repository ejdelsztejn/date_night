require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/binary_search_tree'

class BinarySearchTreeTest < MiniTest::Test
  def test_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_default_root_node_is_nil
    tree = BinarySearchTree.new

    assert_nil nil, tree.root_node
  end

  def test_it_can_insert_a_root_node
    tree = BinarySearchTree.new

    tree.insert(88, "Big Hero 6")

    assert_equal 88, tree.root_node.rating
    assert_equal "Big Hero 6", tree.root_node.movie_title
  end

  def test_it_can_add_addtional_nodes
    tree = BinarySearchTree.new

    tree.insert(88, "Big Hero 6")
    tree.insert(65, "Interstellar")

    assert_equal "Interstellar", tree.root_node.left.movie_title
  end

  def test_it_can_add_left_and_right_nodes
    tree = BinarySearchTree.new

    tree.insert(88, "Big Hero 6")
    tree.insert(65, "Interstellar")
    tree.insert(91, "The Dark Knight")

    assert_equal "Big Hero 6", tree.root_node.movie_title
    assert_equal "Interstellar", tree.root_node.left.movie_title
    assert_equal "The Dark Knight", tree.root_node.right.movie_title
  end

  def test_it_returns_depth_when_adding_new_node
    tree = BinarySearchTree.new

    assert_equal 0, tree.insert(88, "Big Hero 6")
    assert_equal 1, tree.insert(65, "Interstellar")
    assert_equal 1, tree.insert(91, "The Dark Knight")
    assert_equal 2, tree.insert(10, "Master of Disguise")
  end

  def test_it_includes_or_doesnt_include_a_rating
    tree = BinarySearchTree.new

    tree.insert(88, "Big Hero 6")
    tree.insert(65, "Interstellar")

    assert_equal true, tree.include?(88)
    assert_equal true, tree.include?(65)
    assert_equal false, tree.include?(27)
  end

  def test_it_returns_depth_of_a_node
    tree = BinarySearchTree.new

    tree.insert(88, "Big Hero 6")
    tree.insert(65, "Interstellar")
    tree.insert(91, "The Dark Knight")
    tree.insert(10, "Master of Disguise")

    assert_equal 0, tree.depth_of(88)
    assert_equal 1, tree.depth_of(65)
    assert_equal 1, tree.depth_of(91)
    assert_equal 2, tree.depth_of(10)
  end

  def test_it_can_find_the_max_rating
    skip
    tree = BinarySearchTree.new

    tree.insert(88, "Big Hero 6")
    tree.insert(65, "Interstellar")
    tree.insert(91, "The Dark Knight")
    tree.insert(10, "Master of Disguise")

    assert_equal 91, tree.max
  end

  def test_it_can_find_the_min_rating
    skip
    tree = BinarySearchTree.new

    tree.insert(88, "Big Hero 6")
    tree.insert(65, "Interstellar")
    tree.insert(91, "The Dark Knight")
    tree.insert(10, "Master of Disguise")

    assert_equal 10, tree.min
  end
end
