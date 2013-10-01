# Just wanted something to fake it with.
class SimpleKeystore
  def initialize
    @store = Hash.new
  end

  def member?(o)
    @store.member?(o.key)
  end

  def add(o)
    raise DuplicateItemException if member?(o)
    @store[o.key] = o
  end

  def get(key)
    @store[key]
  end

  def size; @store.size; end
end
