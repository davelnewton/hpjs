require "minitest"
require "minitest/autorun"

require "bid"
require "item"
require "exceptions"
require "simple_auctions"

class TestAuctionBasics < Minitest::Test
  def setup
    @auctions = SimpleAuctions.new
    @item = Item.new("Item #1", 8.00)
    @auctions.create_auction_for(@item)
  end

  def test_new_auction_for_same_item
    assert_raises(DuplicateItemException) { @auctions.create_auction_for(@item) }
  end

  def test_bid_before_auction_started
    assert_raises(UnstartedAuctionException) { @auctions.bid(@item, Bid.new("Dave", 12.00)) }
  end

  def test_bid_after_auction_started
    @auctions.start(@item)
    @auctions.bid(@item, Bid.new("Dave", 12.00))
    assert @auctions.auction_for(@item).has_bids?
  end

  def test_lower_bid
    @auctions.start(@item)
    @auctions.bid(@item, Bid.new("Dave", 12.00))
    assert_raises(InvalidBidAmountException) { @auctions.bid(@item, Bid.new("Jimmy", 10.00)) }
  end

  def test_finish_before_start_auction
    assert_raises(UnstartedAuctionException) { @auctions.finish(@item) }
  end

  def test_finish_unsold_item_auction
    @auctions.start(@item)
    @auctions.bid(@item, Bid.new("Dave", 5.00))
    auction = @auctions.finish(@item)
    refute auction.active?
    refute auction.sold?
    assert_raises(AuctionAlreadyEndedException) { @auctions.start(@item) }
  end

  def test_finish_sold_item_auction
    @auctions.start(@item)
    @auctions.bid(@item, Bid.new("Dave", 12.00))
    auction = @auctions.finish(@item)
    refute auction.active?
    assert auction.sold?
    assert_raises(AuctionAlreadyEndedException) { @auctions.start(@item) }
  end    
end
