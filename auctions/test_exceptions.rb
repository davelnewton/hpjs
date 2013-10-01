require "bid"
require "exceptions"

require "minitest"
require "minitest/autorun"

class TestExceptions < Minitest::Test
  def foo
    b = Bid.new("Dave", 12.50)
    raise InvalidBidAmountException.new(b, 10.00)
  end

  def test_bid_amount_exception_sanity
    assert_raises(InvalidBidAmountException) { foo }
  end
end
