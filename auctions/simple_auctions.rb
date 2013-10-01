require "pry"

require "exceptions"
require "simple_auction"
require "simple_guids"
require "simple_keystore"

class SimpleAuctions
  attr_accessor :guids, :auctions, :items

  def initialize
    self.guids = SimpleGuids.new
    self.auctions = SimpleKeystore.new
  end

  def create_auction_for(item)
    auction = SimpleAuction.new(item)
    self.auctions.add(auction)
  end

  def bid(item, bid)
    auction_for(item).bid(bid)
  end

  def start(item)
    auction_for(item).start
  end

  def finish(item)
    auction = auction_for(item)
    raise UnstartedAuctionException unless auction.active?
    auction.finish
    auction
  end

  def auction_for(item)
    auction = auctions.get(item.key)
    raise UnknownAuctionException if auction.nil?
    auction    
  end

  def status_for(item, out=$stdout)
    auction_for(item).status(out)
  end
end
