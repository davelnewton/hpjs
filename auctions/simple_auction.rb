# Auctions have an item and bids, and flags to indicate
# whether or not the auction is active, has been ended,
# and the item has been sold.
class SimpleAuction
  attr_accessor :item, :bids, :active, :sold, :ended

  def initialize(item)
    self.item = item
    self.bids = []
    self.active = false
    self.sold = false
    self.ended = false
  end

  def bid(bid)
    assert_valid bid
    self.bids << bid
  end

  def assert_valid(bid)
    raise UnstartedAuctionException unless active?

    if has_bids? && (bid.amount <= last_bid.amount)
      raise InvalidBidAmountException.new(bid, last_bid.amount)
    end
  end

  def start
    raise AuctionAlreadyEndedException if self.ended
    self.active = true
  end
  
  def finish
    self.ended = true
    self.active = false
    if last_bid.amount > item.reserve
      self.sold = true
    end
  end

  def status(out=$stdout)
    sell_status = sold? ? "Yes, to #{last_bid.bidder} for #{last_bid.amount}" : "No, last bid is #{last_bid.amount} by #{last_bid.bidder}"
    s = <<-EOS
      Auction item: #{item.name}
      Reserve: #{item.reserve}
      Active? #{active? ? "Yes" : "No" }
      Ended? #{ended? ? "Yes" : "No" }
      Sold? #{sell_status}
    EOS
    s
  end

  def key; item.key; end
  def active?; self.active; end
  def sold?; self.sold; end
  def ended?; self.ended; end
  def last_bid; bids.last; end
  def first_bid?; bids.size.zero?; end
  def has_bids?; bids.size.nonzero?; end
end
