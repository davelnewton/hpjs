require "exceptions"

# Bids have a bidder and an amount.
#
# Currently the amount is expected to be a simple float; sorry.
class Bid
  attr_accessor :bidder, :amount

  def initialize(bidder, amount)
    self.bidder = bidder
    self.amount = amount

    raise InvalidBidAmountException.new(self) if self.amount <= 0.00
  end
end
