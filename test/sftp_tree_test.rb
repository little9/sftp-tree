require 'test_helper'

class SftpTreeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SftpTree::VERSION
  end

  def test_that_it_can_connect
    data = SftpTree::get_tree('test.rebex.net', 'demo','password','/')
    refute_nil data[:text]
  end

  def test_that_it_has_tree
    data = SftpTree::get_tree('test.rebex.net', 'demo','password','/')
    refute_nil data[:children][0][:text]
  end

  def test_that_you_can_get_jstree_style_tree
    data = SftpTree::get_core_tree('test.rebex.net', 'demo', 'password', '/')
    assert_equal(data[:data][:text], '/')
    
  end
  
end
