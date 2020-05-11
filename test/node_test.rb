require './test/test_helper'

class NodeTest < MiniTest::Test
  def test_it_exists
    node = Node.new(88, "Big Hero 6")

    assert_instance_of Node, node
  end

  def test_it_has_a_rating_and_movie_title
    node = Node.new(88, "Big Hero 6")

    assert_equal 88, node.rating
    assert_equal "Big Hero 6", node.movie_title
  end

  def test_default_left__right_and_depth_are_nil
    node = Node.new(88, "Big Hero 6")

    assert_nil nil, node.left
    assert_nil nil, node.right
    assert_nil nil, node.depth
  end
end
