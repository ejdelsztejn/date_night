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
end
