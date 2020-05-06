require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/binary_search_tree'

class BinarySearchTreeTest < MiniTest::Test
  def test_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end
end
