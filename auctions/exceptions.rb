# App-specific exceptions; they should be in their related modules.
#
# If there were any modules.

class DuplicateItemException < Exception
  def initialize
    super "Keystore item keys must be unique"
  end
end

class InvalidBidAmountException < Exception
  attr_accessor :bid, :minimum

  def initialize(bid, minimum=0.0)
    self.bid = bid
    self.minimum = minimum
    super "New bids must increase the bid amount; minimum bid is #{minimum}"
  end
end

class UnknownAuctionException < Exception; end
class UnstartedAuctionException < Exception; end
class AuctionAlreadyEndedException < Exception; end
class InvalidItemReserveException < Exception; end
