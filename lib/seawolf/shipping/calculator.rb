class Calculator
  def initialize(ships:, amount_to_transport:)
    @ships, @amount_to_transport = ships, amount_to_transport
  end

  def minimum_ships
    amount_to_minimum_ships = {}

    ships_sorted_by_lowest_to_highest_capacity(@ships).each do |ship|
      (1..@amount_to_transport).each do |amount|

        if ship.can_ship_amount?(amount)
          new_ships = [ship] * ship.number_of_possible_trips(amount)

          unless ship.can_ship_entire_amount?(amount)
            new_ships += amount_to_minimum_ships[ship.unshippable_amount(amount)]
          end

          if new_ships_decreases_minimum_ships?(amount_to_minimum_ships, new_ships, amount)
            amount_to_minimum_ships[amount] = new_ships
          end
        end
      end
    end

    amount_to_minimum_ships[@amount_to_transport]
  end

private

  def ships_sorted_by_lowest_to_highest_capacity(ships)
    ships.sort_by { |ship| ship.capacity }
  end

  def new_ships_decreases_minimum_ships?(amount_to_minimum_ships, new_ships, amount)
    amount_to_minimum_ships[amount].nil? ||
    new_ships.count <= amount_to_minimum_ships[amount].count
  end
end
