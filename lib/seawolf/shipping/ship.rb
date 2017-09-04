class Ship
  attr_reader :identifier, :name, :capacity

  def initialize(identifier:, name:, capacity:)
    @identifier, @name, @capacity = [identifier, name, capacity]
  end

  def self.all_by_lowest_to_highest_capacity
    SHIPS.sort_by { |ship| ship.capacity }
  end

private

  SHIPS = [
    Ship.new(identifier: 'S', name: 'Speedy',  capacity: 1),
    Ship.new(identifier: 'E', name: 'El Gamo', capacity: 6),
    Ship.new(identifier: '7', name: 'Seven', capacity: 7),
    Ship.new(identifier: 'P', name: 'Preuben', capacity: 8),
    Ship.new(identifier: 'Q', name: 'Quencher', capacity: 13)
  ]
end