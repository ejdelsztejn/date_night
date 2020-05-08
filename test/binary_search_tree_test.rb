require './test/test_helper'
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
    # skip
    tree1 = BinarySearchTree.new

    tree1.insert(88, "Big Hero 6")
    tree1.insert(65, "Interstellar")
    tree1.insert(91, "The Dark Knight")
    tree1.insert(10, "Master of Disguise")

    assert_equal 91, tree1.max

    tree2 = BinarySearchTree.new

    tree2.insert(88, "Big Hero 6")
    tree2.insert(65, "Interstellar")
    tree2.insert(91, "The Dark Knight")
    tree2.insert(10, "Master of Disguise")
    tree2.insert(33, "Jumanji")
    tree2.insert(56, "Book Club")
    tree2.insert(85, "Insidious")
    tree2.insert(100, "Legally Blonde")

    assert_equal 100, tree2.max
  end

  def test_it_can_find_the_min_rating
    # skip
    tree1 = BinarySearchTree.new

    tree1.insert(88, "Big Hero 6")
    tree1.insert(65, "Interstellar")
    tree1.insert(91, "The Dark Knight")
    tree1.insert(10, "Master of Disguise")

    assert_equal 10, tree1.min

    tree2 = BinarySearchTree.new

    tree2.insert(88, "Big Hero 6")
    tree2.insert(65, "Interstellar")
    tree2.insert(91, "The Dark Knight")
    tree2.insert(10, "Master of Disguise")
    tree2.insert(33, "Jumanji")
    tree2.insert(56, "Book Club")
    tree2.insert(85, "Insidious")
    tree2.insert(100, "Legally Blonde")
    tree2.insert(7, "Battlefield Earth: A Saga of the Year 3000")

    assert_equal 7, tree2.min
  end

  def test_it_can_sort_the_nodes
    # skip
    tree = BinarySearchTree.new

    tree.insert(88, "Big Hero 6")
    tree.insert(65, "Interstellar")
    tree.insert(91, "The Dark Knight")
    tree.insert(10, "Master of Disguise")

    assert_equal [{"Big Hero 6"=>88},
                  {"The Dark Knight"=>91},
                  {"Interstellar"=>65},
                  {"Master of Disguise"=>10},], tree.sort
  end

  def test_it_can_load_movies_text_file
    tree = BinarySearchTree.new

    file = './lib/movies.txt'

    assert_equal 99, tree.load(file)
  end

  def test_it_can_determine_health_of_tree
    tree = BinarySearchTree.new

    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], tree.health(0)
    assert_equal [[58, 6, 85]], tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end
end
