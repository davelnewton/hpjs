class Item
  attr_accessor :name, :reserve

  def initialize(name, reserve)
    self.name = name
    self.reserve = reserve

    raise InvalidItemReserveException.new if reserve <= 0.0
  end

  def key; self.name; end
end
