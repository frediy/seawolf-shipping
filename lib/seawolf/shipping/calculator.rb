class Calculator
  def initialize(ships:, amount_to_transport:)
    @ships, @amount_to_transport = ships, amount_to_transport
  end

  def calculate()
    amount_to_smallest_schedule = {}

    ships_sorted_by_lowest_to_highest_capacity(@ships).each do |ship|
      (1..@amount_to_transport).each do |amount|

        if ship.can_ship_amount?(amount)
          amount_to_smallest_schedule[amount] = [ship] * ship.number_of_possible_trips(amount)

          unless ship.can_ship_entire_amount?(amount)
            amount_to_smallest_schedule[amount] += amount_to_smallest_schedule[ship.unshippable_amount(amount)]
          end
        end
      end
    end

    amount_to_smallest_schedule[@amount_to_transport]
  end

private

  def ships_sorted_by_lowest_to_highest_capacity(ships)
    ships.sort_by { |ship| ship.capacity }
  end
end