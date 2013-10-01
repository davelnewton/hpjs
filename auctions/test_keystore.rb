require "minitest"
require "minitest/autorun"

require "item"
require "exceptions"
require "simple_keystore"

class TestKeystore < Minitest::Test
  def setup
    @store = SimpleKeystore.new
  end

  def test_adding_item_works
    assert_equal @store.size, 0
    @store.add(Item.new("Item #1", 10.00))
    assert_equal @store.size, 1
  end

  def test_adding_item_twice
    bid = Item.new("Item #1", 10.00)
    @store.add(bid)
    assert_raises(DuplicateItemException) { @store.add(bid) }
  end
end
