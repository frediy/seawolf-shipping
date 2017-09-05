require "spec_helper"

RSpec.describe Calculator do
  subject(:calculator) do
    described_class.new(ships: ships, amount_to_transport: amount_to_transport)
  end

  let(:ships) do
    [
      Ship.new(identifier: 'A', name: 'Alpha',  capacity: 1),
      Ship.new(identifier: 'B', name: 'Bravo', capacity: 6),
      Ship.new(identifier: 'C', name: 'Charlie', capacity: 8)
    ]
  end

  describe '#minimum_ships' do
    subject(:minimum_ships) { calculator.minimum_ships }

    let(:ship_a_count) { minimum_ships.select { |ship| ship.identifier == 'A' }.count }
    let(:ship_b_count) { minimum_ships.select { |ship| ship.identifier == 'B' }.count }
    let(:ship_c_count) { minimum_ships.select { |ship| ship.identifier == 'C' }.count }

    context 'returns single ship with one trip' do
      let(:amount_to_transport) { 8 }

      specify { expect(ship_a_count).to eq 0 }
      specify { expect(ship_b_count).to eq 0 }
      specify { expect(ship_c_count).to eq 1 }
    end

    context 'returns multiple ships with one trip' do
      let(:amount_to_transport) { 14 }

      specify { expect(ship_a_count).to eq 0 }
      specify { expect(ship_b_count).to eq 1 }
      specify { expect(ship_c_count).to eq 1 }
    end

    context 'returns single ship with multiple trips' do
      let(:amount_to_transport) { 12 }

      specify { expect(ship_a_count).to eq 0 }
      specify { expect(ship_b_count).to eq 2 }
      specify { expect(ship_c_count).to eq 0 }
    end

    context 'returns multiple ships with multiple trips' do
      let(:amount_to_transport) { 20 }

      specify { expect(ship_a_count).to eq 2 }
      specify { expect(ship_b_count).to eq 3 }
      specify { expect(ship_c_count).to eq 0 }
    end
  end
end
