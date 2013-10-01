require "minitest"
require "minitest/autorun"

require "bid"
require "exceptions"

class TestBidBasics < Minitest::Test
  def test_invalid_bid_amount
    assert_raises(InvalidBidAmountException) { bid = Bid.new("Dave", 0.00) }
  end
end
