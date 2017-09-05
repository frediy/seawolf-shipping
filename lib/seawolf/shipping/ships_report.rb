class ShipsReport
  def initialize(ships)
    @ships = ships
  end

  def to_s
    ship_identifier_to_ships = @ships.group_by { |ship| ship.identifier }
    ship_count_and_identifier_strings = ship_identifier_to_ships.map do |identifier, ships|
      "#{ships.count}#{identifier}"
    end
    ship_count_and_identifier_strings.join(' ')
  end
end