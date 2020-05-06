require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < MiniTest::Test
  def test_it_exists
    node = Node.new(88, "Big Hero 6")

    assert_instance_of Node, node
  end
end
