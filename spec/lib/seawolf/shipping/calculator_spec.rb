require "spec_helper"

RSpec.describe Calculator do
  subject(:calculator) do
    described_class.new(ships: ships, amount_to_transport: amount_to_transport)
  end

  let(:ships) do
    [
      Ship.new(identifier: 'S', name: 'Speedy',  capacity: 1),
      Ship.new(identifier: 'E', name: 'El Gamo', capacity: 6),
      Ship.new(identifier: 'P', name: 'Preuben', capacity: 8)
    ]
  end

  describe '#calculate' do
    subject(:calculate) { calculator.calculate }

    context 'returns single ship with one trip' do
      let(:amount_to_transport) { 8 }

      specify { p calculate }
    end

    context 'returns multiple ships with one trip' do
      let(:amount_to_transport) { 14 }

      specify { p calculate }
    end

    context 'returns single ship with multiple trips' do
      let(:amount_to_transport) { 12 }

      specify { p calculate }
    end

    context 'returns multiple ships with multiple trips' do
      let(:amount_to_transport) { 20 }

      specify { p calculate }
    end
  end
end
