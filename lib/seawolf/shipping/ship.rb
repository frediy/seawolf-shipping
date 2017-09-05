class Ship
  attr_reader :identifier, :capacity

  def initialize(identifier:, name:, capacity:)
    @identifier, @name, @capacity = [identifier, name, capacity]
  end

  def number_of_possible_trips(amount)
    amount / capacity
  end

  def unshippable_amount(amount)
    amount - shippable_amount(amount)
  end

  def can_ship_amount?(amount)
    capacity <= amount
  end

  def can_ship_entire_amount?(amount)
    unshippable_amount(amount) == 0
  end

private

  def shippable_amount(amount)
    capacity * number_of_possible_trips(amount)
  end
end
