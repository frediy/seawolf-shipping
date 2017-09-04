class Calculator
  def self.schedule_from_transportation_amount(transportation_amount)
    amount_to_smallest_schedule = {}

    Ship.all_by_lowest_to_highest_capacity.each do |ship|
      (0..transportation_amount).each do |amount|
        max_possible_number_of_trips = amount / ship.capacity
        amount_left = amount - ship.capacity * max_possible_number_of_trips

        if amount_left == 0
          amount_to_smallest_schedule[amount] = [ship] * max_possible_number_of_trips
        else # amount can not be transported only by ship in current iteration
          amount_to_smallest_schedule[amount] = amount_to_smallest_schedule[amount_left] + [ship] * max_possible_number_of_trips
        end
      end
    end
    amount_to_smallest_schedule[transportation_amount]
  end
end